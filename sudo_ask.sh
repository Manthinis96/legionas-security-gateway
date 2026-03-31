#!/bin/bash
# Legiono Saugos Vartai (Legion Security Gateway)
# Naudojimas: ./sudo_ask.sh "komanda" "paaiškinimas, kodėl to reikia"

COMMAND=$1
REASON=$2

if [ -z "$COMMAND" ]; then
    echo "Klaida: Nurodykite komandą."
    exit 1
fi

export DISPLAY=:0

# 1. Informacinis langas
zenity --question \
       --title="Legiono Saugos Patikra" \
       --text="Legionas nori atlikti veiksmą su SUDO teisėmis.\n\n<b>VEIKSMAS:</b> $COMMAND\n<b>PRIEŽASTIS:</b> $REASON\n\nAr leidžiate?" \
       --width=450 \
       --ok-label="Taip, leisti" \
       --cancel-label="Ne, blokuoti"

if [ $? -eq 0 ]; then
    # 2. Slaptažodžio įvedimo langas
    PASS=$(zenity --password --title="Saugumo patvirtinimas" --text="Įveskite sudo slaptažodį:")
    
    if [ -n "$PASS" ]; then
        # 3. Vykdymas terminale parodant progresą
        x-terminal-emulator -e bash -c "echo '$PASS' | sudo -S $COMMAND; echo -e '\nVeiksmas baigtas. Spauskite bet kurį klavišą.'; read -n 1"
        echo "SUCCESS"
    else
        echo "CANCELLED"
        notify-send "Legionas" "Slaptažodis neįvestas. Veiksmas atšauktas. 🛡️"
    fi
else
    echo "CANCELLED"
    notify-send "Legionas" "Veiksmas atšauktas. Saugumas svarbiausia! 🦾🛡️" --icon=dialog-warning
fi
