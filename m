From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:38:29 +0100
Subject: [Buildroot] [git commit branch/next] package/upmpdcli: bump to
 version 1.4.6
Message-ID: <20200224213409.9E7388E90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ef6ed667238a13c1a4a6c691a0a8f33824bba02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 33003a406e..fe1d82202d 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.5.tar.gz.sha256:
-sha256  af0c13b6ab8720d98451307010c33462e9a3f50178bae82c593fd2dd12e31b0e  upmpdcli-1.4.5.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.6.tar.gz.sha256:
+sha256  80ed85a323a1721a9e2ceb64923cedbf69c45f22fb9bc6853c9c11b46dc83a1d  upmpdcli-1.4.6.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 290cdcb1f2..67d805f0cc 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.4.5
+UPMPDCLI_VERSION = 1.4.6
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
