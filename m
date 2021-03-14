From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 21:47:45 +0100
Subject: [Buildroot] [git commit] package/freerdp: bump to version 2.3.1
Message-ID: <20210314202540.AFB8E87659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01e78811db25c34d506138994efd981e4ab60caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/FreeRDP/FreeRDP/blob/2.3.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 8217a2106c..ebb5798ace 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.2.0.tar.gz.sha256
-sha256  19b30759e324ce7a9767af880116a4c571761e9ad9c5d6c98c5b302ff8c24c6c  freerdp-2.2.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.3.1.tar.gz.sha256
+sha256  20071c691c1947ca256149e1d03edec1a5dfbf9960f0ef4e21ecab87433c2178  freerdp-2.3.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 16d58b5aa0..171c248bd2 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.2.0
+FREERDP_VERSION = 2.3.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
