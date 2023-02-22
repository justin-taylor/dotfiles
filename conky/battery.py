from random import random
import re
import os

'''
TODOs:
    animate the arrows '<<<<<' '<<<<' '<<<', TMP
    send notification below another threshold
'''


PATH = '/sys/class/power_supply/BAT0/'
FULL = PATH+'charge_full'
NOW  = PATH+'charge_now'
STATUS = PATH+'status'
THRESHOLD = 20
ARROW_COUNT = 32
ARROW_ENVIRON = 'BATTERY_ARROWS'

os.environ.setdefault(ARROW_ENVIRON, "%d" % ARROW_COUNT)

def read_file_line(file):
    '''
    reads the first line of a file stripping the line break

    @param: [String] file; path to the file being read
    @return: [String] first line of the file without the line break
    '''
    f = open(file)
    temp = re.sub('\n', '', f.readline())
    f.close()
    return temp

def get_float(file):
    '''
    read a file (by calling read_file_line(file) ) 
        and converts the output to a float

    @param: [String] file; path to the file being read
    @return: the contents of the file as a float
    '''
    return float(read_file_line(file))


def format_battery_information(percent, status):
    '''
    Formats the batteries remaining percentage and the status of the battery
    (charging, discharging, unknown...)

    @param [float] percent; the batteries remaining percentage
    @param [String] status; that status of the battery
    '''
    return '%s %d%%' % (status[0:1], int(percent))

def arrows():
    '''
    for now prints a random number of '<' characters to simulate 
    animation. In the future it will animate in a smoother action.
    '''
    #count = int(os.getenv(ARROW_ENVIRON, ARROW_COUNT))
    #if count == ARROW_COUNT:
        #count = 0
    #else:
        #count += 1

    #os.putenv(ARROW_ENVIRON, "%d" % count)
    count = int(random() * ARROW_COUNT)
    return "".join(['<' for i in range(count)])

def get_percent():
    '''
    calculated the battery's remaing power percentage by reading
    system monitoring files
    '''
    capacity = get_float(FULL)
    current = get_float(NOW)
    return current/capacity * 100


#-------------------------------------------------------------------------------
# MAIN
#-------------------------------------------------------------------------------
if __name__ == "__main__":
    percent = get_percent() 
    status = read_file_line(STATUS)

    if percent < THRESHOLD:
        info = format_battery_information(percent, status)
        if status != 'Charging':
            arrows = arrows()
            print '${color #ff0000}   |   Battery: %s %s' % (info, arrows)

        else:
            print '${color #ff0000}   |   Battery: %s' % info

    else:
        print '${color #0077ff}   |   Battery: ${color white}%s' %\
            format_battery_information(percent, status)
