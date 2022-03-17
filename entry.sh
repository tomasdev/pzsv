#!/bin/bash

echo "Installing Project Zomboid Dedicated Server"
bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
        +login anonymous \
        +app_update "${STEAMAPPID}" \
        +quit

echo "Starting up server"
bash "${STEAMAPPDIR}/start-server.sh" -servername "${SERVERNAME}"
