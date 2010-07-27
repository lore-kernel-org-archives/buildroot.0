From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 00:46:14 +0200
Subject: [Buildroot] [pull request] Pull request for branch various-things
Message-ID: <cover.1280270762.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d47c73ee9ba3ab9a5f6a113047e3a4aae1afd278:
  Paul Jones (1):
        zlib: Bump to 1.2.5

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot various-things

Gustavo Zacarias (2):
      Convert net-snmp to autotargets
      Bump samba to 3.3.13 [CVE-2010-2063]

Thomas Petazzoni (1):
      Remove unused X11_PREFIX option

 configs/kb9202_defconfig   |    1 -
 configs/v100sc2_defconfig  |    1 -
 package/Makefile.in        |    4 -
 package/netsnmp/Config.in  |    5 --
 package/netsnmp/netsnmp.mk |  172 ++++++++++----------------------------------
 package/samba/samba.mk     |    2 +-
 package/x11r7/Config.in    |    7 --
 7 files changed, 39 insertions(+), 153 deletions(-)

Thanks,
-- 
Thomas Petazzoni
