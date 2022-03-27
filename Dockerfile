###########################################################
# Dockerfile that builds a Project Zomboid Dedicated Server
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="hola@tomasroggero.com"

ENV SERVERNAME "changeme"
ENV SERVERPASS "changeme"

ENV STEAMAPPID 380870
ENV STEAMAPP pz
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/tomasdev/pzsv

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget=1.20.1-1.1 \
	&& wget "${DLURL}/master/entry.sh" -O "${HOMEDIR}/entry.sh" \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& chmod 755 "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& chown "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& rm -rf /var/lib/apt/lists/*

USER ${USER}

VOLUME ${STEAMAPPDIR}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 8766/udp \
	16261/udp
