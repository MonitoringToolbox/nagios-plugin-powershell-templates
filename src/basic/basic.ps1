# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# The script presented here is a simple Nagios check example, employing a set of   #
# utility functions to guarantee accurate output and exit codes. Although this     #
# version uses fixed values, suitable for straightforward checks, we also offer a  #
# more sophisticated variant that demonstrates how to handle command-line          #
# arguments for more elaborate or flexible scripting.                              #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Main()                                                                           #
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
    $critical_level = 90
    $warning_level = 75
    $test_value = (Get-Random -Minimum 1 -Maximum 101)

    if ($test_value -ge $critical_level) {
        handle_critical "Test Value = $test_value"
    }
    elseif ($test_value -ge $warning_level) {
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
    param (
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
    param (
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
    param (
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
    param (
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

main

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
