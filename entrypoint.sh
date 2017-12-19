#!/bin/bash

# Text formatting details @https://misc.flogisoft.com/bash/tip_colors_and_formatting
# Reset
Color_Off='\e[0m'         # Text Reset

# Regular Colors
Black='\e[0;30m'          # Black
Red='\e[0;31m'            # Red
Green='\e[0;32m'          # Green
Yellow='\e[0;33m'         # Yellow
Blue='\e[0;34m'           # Blue
Purple='\e[0;35m'         # Purple
Cyan='\e[0;36m'           # Cyan
White='\e[0;37m'          # White

# Bold
Bold='\e[1m'               # Bold on
Bold_Off='\e[21m'          # Bold off

# Underline
Underline='\e[4m'          # Underline on
Underline_Off='\e[24m'     # Underline off

# Blinking
Blinking='\e[5m'          # Blinking on
Blinking_Off='\e[25m'     # Blinking off

# Reverse
Reverse='\e[7m'           # Reverse on
Reverse_Off='\e[27m'      # Reverse off

# Background
On_Black='\e[40m'         # Black
On_Red='\e[41m'           # Red
On_Green='\e[42m'         # Green
On_Yellow='\e[43m'        # Yellow
On_Light_Red='\e[101m'    # Light Red
On_Light_Blue='\e[104m'   # Light Blue

shopt -s nullglob;

echo -e "${Reverse}Next to each video there will be an output folder created containing all files for HLS/ DASH streaming.";
echo -e "${Reverse_Off}${Green}${Bold}\nStarting processing ${1}${Bold_Off}${Color_Off}\n";
cd /video/$1;
for file in *
do
    if ( [ -d "${file}" ] && [ "${file}" != "output" ] ); then
        /bin/entrypoint.sh "${1}/${file}";
    else
        if ( [ ${file: -4} == ".avi" ] || [ ${file: -4} == ".mkv" ] || [ ${file: -4} == ".mp4" ] || [ ${file: -4} == ".wmv" ] || [ ${file: -4} == ".ts" ] || [ ${file: -4} == ".mov" ] || [ ${file: -4} == ".flv" ] || [ ${file: -4} == ".webm" ] ); then
            if grep -Fxq "${file}" /video/.auto-dash-hls
            then
                echo -e "${On_Light_Blue}${file} already optimized in previous run. Skipping${Color_Off}";
                continue
            fi

            echo -e "${On_Yellow}${Bold}${file} ${Bold_Off}being transcoded now! Please be patient.${Color_Off}";
            /bin/transcode.sh "${file}";
            if [ ${PIPESTATUS[0]} -eq 0 ]; then
                echo "${file}" >> /video/.auto-dash-hls;
                echo -e "${On_Green}DASH/ HLS compatible files generation for ${Bold}${file} ${Bold_Off}successfully completed${Color_Off}\n";
            else
                echo -e "${On_Light_Red}Optimizing file ${file} failed. Skipping${Color_Off}";
            fi
        fi
    fi
done

echo -e "\n${Reverse}Please do not forget about the ".htaccess"-file next to all other created files inside the output folder${Reverse_Off}\n";
