From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:52:26 +0200
Subject: [Buildroot] [git commit] libev: bump to version 4.15
Message-ID: <20140718180154.BB20E99CC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e09d66831029012c39960eec129051c223b2c78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libev/libev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 11c788d..e4b6c73 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.11
+LIBEV_VERSION = 4.15
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2c or GPLv2+
