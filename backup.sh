#!/usr/bin/env bash



echo "------------------------------------------"
echo "##########################################"
echo "          Endorium Backup Script          "
echo "##########################################"
echo "------------------------------------------"



read -rep "Output dir : " outputdir
echo $outputdir
echo "##########################################"
echo "          Backup Setup                    "
echo "##########################################"


function backup () {
    mkdir /tmp/backup/
    echo "Choose what service for backup ?"
    read "Nginx ? [Y/N]" nginxc
    read "Apache ? [Y/N]" apachec
    read "DHCP ? [Y/N]" dhcpc
    read "Bind ? [Y/N]" bindc
    
    if [[ "$nginxc" =~ ^([yY][eE][sS]|[yY]|[oO][uU][iI]|[oO])$ ]]; then
        nginx
    fi
    if [[ "$apachec" =~ ^([yY][eE][sS]|[yY]|[oO][uU][iI]|[oO])$ ]]; then
        apache
    fi
    if [[ "$dhcpc" =~ ^([yY][eE][sS]|[yY]|[oO][uU][iI]|[oO])$ ]]; then
        dhcp
    fi
    if [[ "$bindc" =~ ^([yY][eE][sS]|[yY]|[oO][uU][iI]|[oO])$ ]]; then
        bind
    fi

    tar -czvf $outputdir.tar.gz /tmp/backup/
    rm -r /tmp/backup/

}

