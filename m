From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:32:26 +0200
Subject: [Buildroot] [git commit] package/freerdp: security bump to version
 2.2.0
Message-ID: <20200721072853.D9AD184758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f0305a95d222b8710bbe69710e58ff7244fe916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2020-15103 - Integer overflow due to missing input sanitation in
rdpegfx channel

https://github.com/FreeRDP/FreeRDP/releases/tag/2.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 6c52d38a4f..8217a2106c 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.1.2.tar.gz.sha256
-sha256  f33bc6aef83b8ad3cbf2cdbc82dcfa980ec2b051efb72650f6f2365d55b79b8d  freerdp-2.1.2.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.2.0.tar.gz.sha256
+sha256  19b30759e324ce7a9767af880116a4c571761e9ad9c5d6c98c5b302ff8c24c6c  freerdp-2.2.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 33b83922cc..4c804c136f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.1.2
+FREERDP_VERSION = 2.2.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
