From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 20:04:36 +0100
Subject: [Buildroot] [git commit] busybox: bump to version 1.24.1
Message-ID: <20151029190717.91F217FA76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a425c49c3201eb4c8d6e4b817688de1851fe110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash |    6 +++---
 package/busybox/busybox.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 1a9b2ff..99fb8e4 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.24.0.tar.bz2.sign
-md5 2fa3110042e518e0e1225c799294664c  busybox-1.24.0.tar.bz2
-sha1 238a9b8a66c31fdcdd00790a840ef03cc77482c7  busybox-1.24.0.tar.bz2
+# From http://busybox.net/downloads/busybox-1.24.1.tar.bz2.sign
+md5 be98a40cadf84ce2d6b05fa41a275c6a  busybox-1.24.1.tar.bz2
+sha1 157d14d24748b4505b1a418535688706a2b81680  busybox-1.24.1.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e5427cf..7f6dbd6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.24.0
+BUSYBOX_VERSION = 1.24.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
