From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:25:17 +0200
Subject: [Buildroot] [git commit branch/next] libnetfilter_conntrack: bump
 to version 1.0.7
Message-ID: <20180513212444.8A64D8847A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2499c489930f904d545e7fd83d09a296d58c0c36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetfilter_conntrack/libnetfilter_conntrack.hash | 8 +++++---
 package/libnetfilter_conntrack/libnetfilter_conntrack.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
index de9d1d3fcf..dd236cd3dc 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
@@ -1,3 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.6.tar.bz2.{md5sum,sha1sum}
-md5	7139c5f408dd9606ffecfd5dcda8175b	libnetfilter_conntrack-1.0.6.tar.bz2
-sha1	015f985a8e171889a67769ba02d070eca53bac07	libnetfilter_conntrack-1.0.6.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.7.tar.bz2.sha256sum
+sha256	33685351e29dff93cc21f5344b6e628e41e32b9f9e567f4bec0478eb41f989b6	libnetfilter_conntrack-1.0.7.tar.bz2
+
+# Hash for license file:
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index 2e9f6b7a64..40b74fe92d 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.6
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.7
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
