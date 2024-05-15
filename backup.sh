#!/usr/bin/env bash

function nginx () {
    mkdir -p /tmp/backup/nginx
    cp -R /etc/nginx/ /tmp/backup/nginx/
}

function apache () {
    mkdir -p /tmp/backup/apache
    cp -R /etc/apache/ /tmp/backup/apache/
}

function dhcp () {
    mkdir -p /tmp/backup/dhcp
    cp -R /etc/dhcp/ /tmp/backup/dhcp/
}

function bind () {
    mkdir -p /tmp/backup/bind
    cp -R /etc/bind/ /tmp/backup/bind/
}

function backup () {
    mkdir /tmp/backup/
    echo "Choose what service for backup ? "
    read -rep "Nginx ? [Y/N] : " nginxc
    read -rep "Apache ? [Y/N] : " apachec
    read -rep "DHCP ? [Y/N] : " dhcpc
    read -rep "Bind ? [Y/N] : " bindc

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

echo "------------------------------------------"
echo "##########################################"
echo "          Endorium Backup Script          "
echo "##########################################"
echo "------------------------------------------"

read -rep "Output File : " outputdir
echo $outputdir
echo "##########################################"
echo "          Backup Setup                    "
echo "##########################################"
backup
