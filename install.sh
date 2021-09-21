#!/bin/bash
set -e

set -a
. ./features.env
set +a

LANG=${_JOSHSPICER_DEVCONTAINER_HELLOWORLD_LANG:-undefined}
HAS_COLOR=${_JOSHSPICER_DEVCONTAINER_HELLOWORLD_HAS_COLOR:-true}

tee /usr/hello.sh > /dev/null \
<< EOF
#!/bin/bash
RED='\033[0;91m'
NC='\033[0m' # No Color
if [[ "$HAS_COLOR" == true ]]; then
        echo -e "\${RED}"
fi
case "$LANG" in
        "english")
                echo -n -e "Hello, there!"
                ;;
        "italian")
                echo -n -e "Salve!"
                ;;
        *)
                echo -n -e "Beep Boop"
esac
echo -e "\${NC}"
EOF

chmod +x /usr/hello.sh
sudo cat '/usr/hello.sh' > /usr/local/bin/hello
sudo chmod +x /usr/local/bin/hello
