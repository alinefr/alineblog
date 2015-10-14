{% set www_root = salt['pillar.get']('project_path','/vagrant') %}

npm:
  pkg.installed

/tmp/meteor.sh:
  file.managed:
    - source: http://install.meteor.com/
    - source_hash: md5=90e7d91b0dd2569b7a7c93967a594f4c
    - mode: 755

  cmd.wait:
    - cwd: {{ www_root }}
    - watch: 
      - file: /tmp/meteor.sh
