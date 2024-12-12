mkdir -p ~/.config/ovos-installer
cat <<EOF > ~/.config/ovos-installer/scenario.yaml
---
uninstall: false
method: virtualenv
channel: development
profile: satellite
hivemind:
  host: 192.168.1.75
  port: 5678
  key: 3d7b957f7ead84f3d069408e960d1ee7
  password: ovos
features:
  skills: false
  extra_skills: false
  gui: false
rapsberry_pi_tuning: true
share_telemetry: true
EOF
