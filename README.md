# AWS Grafana Monitoring

This folder contains a simple Docker setup for Grafana OSS.

## Files

- `Dockerfile` - builds a Grafana OSS image with optional plugin installation and provisioning support.
- `provisioning/datasources/datasource.yml` - configures a Prometheus datasource.
- `provisioning/dashboards/dashboard.yml` - configures dashboard provisioning.
- `dashboards/sample-dashboard.json` - example empty dashboard file.

## Build

```bash
docker build -t grafana-oss .
```

To install plugins during the build:

```bash
docker build --build-arg GF_INSTALL_PLUGINS="grafana-piechart-panel" -t grafana-oss .
```

## Run

```bash
docker run -d -p 3000:3000 --name grafana-oss grafana-oss
```

Open Grafana on `http://localhost:3000`.

## Notes

- The image uses the official `grafana/grafana-oss:latest` base image.
- Provisioned datasource assumes a Prometheus instance available at `http://prometheus:9090`.
- Update the datasource URL or add additional provisioning files as needed.
