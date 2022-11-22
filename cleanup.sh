#!/bin/bash
cd /src/github.com/DataDog
cp -r datadog-agent-backup datadog-agent
cd datadog-agent
#inv system-probe.build
#cp -r /opt/datadog-agent/embedded/share/system-probe/ebpf/* bin/system-probe
#cp -r /opt/datadog-agent/embedded/share/system-probe/ebpf/runtime/* bin/system-probe
docker run -v "$PWD:/go/src/github.com/DataDog/datadog-agent" -v "/tmp/omnibus:/omnibus" -v "/tmp/opt/datadog-agent:/opt/datadog-agent" -v"/tmp/gems:/gems" --workdir=/go/src/github.com/DataDog/datadog-agent datadog/agent-buildimages-deb_x64 inv -e agent.omnibus-build  --base-dir=/omnibus --gem-path=/gems

