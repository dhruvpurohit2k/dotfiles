#!/bin/bash

# !!! IMPORTANT: Replace these with your actual sink names !!!
HEADSET_SINK="alsa_output.pci-0000_28_00.4.analog-stereo"
SPEAKER_SINK="alsa_output.pci-0000_26_00.1.hdmi-stereo"
# Example:
# HEADSET_SINK="alsa_output.usb-Logitech_G533_Gaming_Headset-00.analog-stereo"
# SPEAKER_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"

# Check if the sink names have been configured
if [ "$HEADSET_SINK" == "YOUR_HEADSET_SINK_NAME_HERE" ] || [ "$SPEAKER_SINK" == "YOUR_SPEAKER_SINK_NAME_HERE" ]; then
    notify-send "Audio Script Error" "Please configure headset and speaker sink names in the script."
    exit 1
fi

CURRENT_DEFAULT_SINK=$(pactl get-default-sink)
TARGET_SINK=""

if [ "$CURRENT_DEFAULT_SINK" == "$HEADSET_SINK" ]; then
    TARGET_SINK="$SPEAKER_SINK"
    ICON="" # Speaker icon (adjust if your icons are different)
    DEVICE_NAME="Speakers"
else
    TARGET_SINK="$HEADSET_SINK"
    ICON="" # Headphone icon
    DEVICE_NAME="Headset"
fi

# Set the new default sink
pactl set-default-sink "$TARGET_SINK"
if [ $? -ne 0 ]; then
    notify-send "Audio Switch Error" "Failed to set default sink to $DEVICE_NAME."
    exit 1
fi

# Move all existing sink-inputs to the new default sink
pactl list short sink-inputs | while read -r stream; do
    STREAM_ID=$(echo "$stream" | awk '{print $1}')
    pactl move-sink-input "$STREAM_ID" "$TARGET_SINK"
done

# notify-send -i "$ICON" "Audio Output Changed" "Switched to $DEVICE_NAME"

exit 0
