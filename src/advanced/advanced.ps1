# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# This Nagios check script serves as a more sophisticated example that uses        #
# utility functions to guarantee the accuracy of the output and exit code.         #
#                                                                                  #
# Unlike the basic version, this one utilizes command-line parameters to override  #
# the default hard-coded values, thereby enabling more advanced or portable        #
# scripting. Nevertheless, we also supply a basic version suitable for checks that #
# don't demand parameters.                                                         #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Parameters                                                                       #
# -------------------------------------------------------------------------------- #
# The command line parameters with associated default values.                      #
# -------------------------------------------------------------------------------- #

param (
    [switch]$Help,
    [float]$WarningLevel = 75,
    [float]$CriticalLevel = 90
)

# -------------------------------------------------------------------------------- #
# Main                                                                             #
# -------------------------------------------------------------------------------- #
# This function is where you can include all the code related to the check. You're #
# free to define additional functions and invoke them whenever necessary.          #
#                                                                                  #
# In this template, we've generated a random number to illustrate how to call the  #
# core functions that manage the different states. However, real tests will be     #
# more intricate and elaborate, but they should adhere to the same fundamental     #
# structure.                                                                       #
# -------------------------------------------------------------------------------- #

function main {
    $test_value = Get-Random -Minimum 1 -Maximum 101

    if ($test_value -ge $CriticalLevel) {
        handle_critical "Test Value = $test_value"
    }
    elseif ($test_value -ge $WarningLevel) {
        handle_warning "Test Value = $test_value"
    }
    elseif ($test_value -ge 0) {
        handle_ok "Test Value = $test_value"
    }
    else {
        handle_unknown "Test Value = $test_value"
    }
}

# -------------------------------------------------------------------------------- #
# Usage (-h parameter)                                                             #
# -------------------------------------------------------------------------------- #
# This function is used to show the user 'how' to use the script.                  #
# -------------------------------------------------------------------------------- #

function usage {
    $CommandPath = Split-Path -Path $PSCommandPath -Leaf

    @"
  Usage: $CommandPath [ -Help ] [ -CriticalLevel value ] [ -WarningLevel value ]
    -Help           : Print this screen
    -CriticalLevel  : Critical level [Default: $CriticalLevel]
    -WarningLevel   : Warn level [Default: $WarningLevel]
"@
    exit 0
}

# -------------------------------------------------------------------------------- #
# Process Arguments                                                                #
# -------------------------------------------------------------------------------- #
# This function handles the input from the command line. In this template, we've   #
# included an illustration of how to retrieve and process fresh warning and        #
# critical values.                                                                 #
#                                                                                  #
# You can add as many fresh inputs as your check requires. It's important to       #
# ensure that all the values are designated as global variables so that Main() can #
# access them easily.                                                              #
# -------------------------------------------------------------------------------- #

function process_arguments {
    if ($Help) {
        usage
    }

    if ($WarningLevel -ge $CriticalLevel) {
        handle_unknown "Warn level MUST be lower than Critical level"
    }

    main
}

# -------------------------------------------------------------------------------- #
# STOP HERE!                                                                       #
# -------------------------------------------------------------------------------- #
# The functions listed below are integral to the template and do not necessitate   #
# any modifications to use this template. If you intend to make changes to the     #
# code beyond this point, please make certain that you comprehend the consequences #
# of those alterations!                                                            #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Handle OK                                                                        #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'OK' prefix and  #
# subsequently terminate the script with the requisite exit code of 0.             #
# -------------------------------------------------------------------------------- #

function handle_ok {
    param(
        [string]$message
    )

    if ($message) {
        Write-Host "OK - $message"
    }

    exit 0
}

# -------------------------------------------------------------------------------- #
# Handle Warning                                                                   #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'WARNING' prefix #
# and subsequently terminate the script with the requisite exit code of 1.         #
# -------------------------------------------------------------------------------- #

function handle_warning {
    param(
        [string]$message
    )

    if ($message) {
        Write-Host "WARNING - $message"
    }

    exit 1
}

# -------------------------------------------------------------------------------- #
# Handle Critical                                                                  #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'CRITICAL'       #
# prefix and subsequently terminate the script with the requisite exit code of 2.  #
# -------------------------------------------------------------------------------- #

function handle_critical {
    param(
        [string]$message
    )

    if ($message) {
        Write-Host "CRITICAL - $message"
    }

    exit 2
}

# -------------------------------------------------------------------------------- #
# Handle Unknown                                                                   #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'UNKNOWN' prefix #
# and subsequently terminate the script with the requisite exit code of 3.         #
# -------------------------------------------------------------------------------- #

function handle_unknown {
    param(
        [string]$message
    )

    if ($message) {
        Write-Host "UNKNOWN - $message"
    }

    exit 3
}

# -------------------------------------------------------------------------------- #
# The Core                                                                         #
# -------------------------------------------------------------------------------- #
# This is the central component of the script.                                     #
# -------------------------------------------------------------------------------- #

process_arguments $args

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
