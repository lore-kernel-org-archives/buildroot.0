From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 20:14:28 +0200
Subject: [Buildroot] [git commit] simicsfs: bump to version 1.18
Message-ID: <20140923181859.0E7189D70B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfd33b956e1e86c68c01c7692f2789a454c53c2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix support for kernel > 3.15

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/simicsfs/simicsfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
index 3acd265..99dda84 100644
--- a/package/simicsfs/simicsfs.mk
+++ b/package/simicsfs/simicsfs.mk
@@ -4,7 +4,7 @@
 #
 ###############################################################################
 
-SIMICSFS_VERSION = 1.17
+SIMICSFS_VERSION = 1.18
 SIMICSFS_SITE = http://download.simics.net/pub
 SIMICSFS_LICENSE = GPLv2+
 SIMICSFS_LICENSE_FILES = hostfs.h
