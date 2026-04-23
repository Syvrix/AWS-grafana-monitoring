# syntax=docker/dockerfile:1
FROM grafana/grafana-oss:latest

# Optional Grafana plugins can be installed at build time via build argument.
ARG GF_INSTALL_PLUGINS=""
RUN if [ -n "$GF_INSTALL_PLUGINS" ]; then \
      grafana-cli --pluginsDir /var/lib/grafana/plugins plugins install $GF_INSTALL_PLUGINS; \
    fi

# Use provisioning to automatically configure datasources and dashboards.
COPY provisioning /etc/grafana/provisioning
COPY dashboards /var/lib/grafana/dashboards

EXPOSE 3000
USER grafana
