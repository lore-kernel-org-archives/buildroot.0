From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:50:41 +0200
Subject: [Buildroot] [git commit] libdvdnav: bump to version 6.0.0
Message-ID: <20180429165326.C93E58A35C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de8f54ad9de4ec07fcde1b57cf4124edd9c156b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvdnav/libdvdnav.hash | 7 +++++--
 package/libdvdnav/libdvdnav.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index d3b6fdb810..c251d0af27 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,2 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libdvdnav/5.0.3/libdvdnav-5.0.3.tar.bz2.sha256
-sha256	5097023e3d2b36944c763f1df707ee06b19dc639b2b68fb30113a5f2cbf60b6d	libdvdnav-5.0.3.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.0/libdvdnav-6.0.0.tar.bz2.sha256
+sha256	f0a2711b08a021759792f8eb14bb82ff8a3c929bf88c33b64ffcddaa27935618	libdvdnav-6.0.0.tar.bz2
+
+# Hash for license file:
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 5cb47ab0ba..549a31829f 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 5.0.3
+LIBDVDNAV_VERSION = 6.0.0
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
