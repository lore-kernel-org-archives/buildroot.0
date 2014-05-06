From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:35 -0500
Subject: [Buildroot] [PATCH 00/11] License Updates
Message-ID: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds license information to packages that currently
do not have any. It adds <pkg>_LICENSE variable to all the packages
and the <pkg>_LICENSE_FILES where licenses are available.

Thanks,
-Ryan

Ryan Barnett (11):
  dsp-tools: add license information
  memstat: add license information
  openssh: add license information
  python-netifaces: add license information
  python-pyasn: update license information
  python-setuptools: add license information
  python-serial: add license information
  tidsp-binaries: add license information
  xerces: add license information
  nfs-utils: add license information
  portmap: add license information

 package/dsp-tools/dsp-tools.mk                 |    2 ++
 package/memstat/memstat.mk                     |    2 ++
 package/nfs-utils/nfs-utils.mk                 |    2 ++
 package/openssh/openssh.mk                     |    2 ++
 package/portmap/portmap.mk                     |    2 ++
 package/python-netifaces/python-netifaces.mk   |    2 ++
 package/python-pyasn/python-pyasn.mk           |    3 ++-
 package/python-serial/python-serial.mk         |    2 ++
 package/python-setuptools/python-setuptools.mk |    2 ++
 package/tidsp-binaries/tidsp-binaries.mk       |    2 ++
 package/xerces/xerces.mk                       |    2 ++
 11 files changed, 22 insertions(+), 1 deletion(-)

-- 
1.7.9.5
