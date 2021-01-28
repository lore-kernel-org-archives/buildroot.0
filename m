From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:48 +0100
Subject: [Buildroot] [PATCH 0/9] packages: Add more SELinux modules to some
 packages
Message-ID: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

This series is a second batch of patches adding a match between packages
and their corresponding module in the SELinux refpolicy.

This series focuses on the following packages : 

 - alsa-utils (for alsa-ctl)
 - bridge-utils (for brctl)
 - dmidecode
 - hwloc
 - kexec and kexec-lite
 - kismet
 - logrotate
 - mcelog

Thanks,

Maxime

Maxime Chevallier (9):
  package/alsa-utils: add SELinux repolicy module
  package/bridge-utils: add SELinux refpolicy module
  package/dmidecode: add SELinux refpolicy module
  package/hwloc: add SELinux refpolicy module
  package/kexec: add SELinux refpolicy module
  package/kexec-lite: add SELinux refpolicy module
  package/kismet: add SELinux refpolicy module
  package/logrotate: add SELinux refpolicy module
  package/mcelog: add SELinux refpolicy module

 package/alsa-utils/alsa-utils.mk     | 4 ++++
 package/bridge-utils/bridge-utils.mk | 1 +
 package/dmidecode/dmidecode.mk       | 1 +
 package/hwloc/hwloc.mk               | 1 +
 package/kexec-lite/kexec-lite.mk     | 1 +
 package/kexec/kexec.mk               | 1 +
 package/kismet/kismet.mk             | 2 ++
 package/logrotate/logrotate.mk       | 1 +
 package/mcelog/mcelog.mk             | 1 +
 9 files changed, 13 insertions(+)

-- 
2.25.4
