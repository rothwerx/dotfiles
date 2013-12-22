# .bashrc should get sourced with every shell

if [ -f .bashrc.local ]; then
    . .bashrc.local
fi
