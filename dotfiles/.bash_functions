# Set audio volume
# For example, `a 50` sets volume to 50%
function a()
{
    amixer set Master "$1"%
}

# Set brightness
# For example, `b 50` sets brightness to 50%
function b()
{
    xbacklight -set "$1"%
}
