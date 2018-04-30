From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 09:36:42 +0200
Subject: [Buildroot] [git commit] libgee: bump to version 0.20.1
Message-ID: <20180430073717.6930D8A484@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1b96eda611a95b903ade41a65263764e2696694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgee/libgee.hash | 7 +++++--
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index 83ac810156..77f39d6b69 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,2 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.18/libgee-0.18.1.sha256sum
-sha256	99686bbe5a9c89ba9502c25f61314ee8efa0dd2a1159c9a639afc1458c2839a2	libgee-0.18.1.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.1.sha256sum
+sha256	bb2802d29a518e8c6d2992884691f06ccfcc25792a5686178575c7111fea4630	libgee-0.20.1.tar.xz
+
+# Hash for license file:
+sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 9d87169e44..264ba98946 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEE_VERSION_MAJOR = 0.18
+LIBGEE_VERSION_MAJOR = 0.20
 LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).1
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
