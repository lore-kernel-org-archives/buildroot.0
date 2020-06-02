From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 20:01:49 -0000
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.4.9
Message-ID: <20200602200120.0CC458256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e71f1af6dabc1bbb45811fb695e07b43326df55b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index fe1d82202d..6eb6c7b9ea 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.6.tar.gz.sha256:
-sha256  80ed85a323a1721a9e2ceb64923cedbf69c45f22fb9bc6853c9c11b46dc83a1d  upmpdcli-1.4.6.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.9.tar.gz.sha256:
+sha256  ace5a3166891109d2a874f21306986857ee2620230a77751ed6209f7b5cc9c58  upmpdcli-1.4.9.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 67d805f0cc..ab4b8bfd3c 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.4.6
+UPMPDCLI_VERSION = 1.4.9
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
