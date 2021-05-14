From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 May 2021 00:03:14 +0200
Subject: [Buildroot] [PATCH 0/2] Add jh71xx-tools package
Message-ID: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As suggested by Drew Fustini, this small series adds a jh71xx-tools
host package to build the jh7100-recover utility, which is useful to
recover BeagleV platforms. This package is also enabled in
beaglev_defconfig.

Thomas

Thomas Petazzoni (2):
  package/jh71xx-tools: new package
  configs/beaglev: enable host jh71xx-tools

 DEVELOPERS                             |  1 +
 board/beaglev/readme.txt               |  4 +++-
 configs/beaglev_defconfig              |  1 +
 package/Config.in.host                 |  1 +
 package/jh71xx-tools/Config.in.host    |  7 +++++++
 package/jh71xx-tools/jh71xx-tools.hash |  3 +++
 package/jh71xx-tools/jh71xx-tools.mk   | 20 ++++++++++++++++++++
 7 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/jh71xx-tools/Config.in.host
 create mode 100644 package/jh71xx-tools/jh71xx-tools.hash
 create mode 100644 package/jh71xx-tools/jh71xx-tools.mk

-- 
2.31.1
