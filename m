From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 19:23:51 +0100
Subject: [Buildroot] [git commit] package/mdevd: bump version to 0.1.1.1
Message-ID: <20191027181716.439058A3C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ca7140741226d17b4c1133ad6c801c772c3ac58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://git.skarnet.org/cgi-bin/cgit.cgi/mdevd/log/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdevd/mdevd.hash | 2 +-
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index b4652c6b67..2b36740fb4 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 302819dceb2400f299ef8f04828a4fe9156d7334e41ce34d61db37fbc2aa7e8f  mdevd-0.1.1.0.tar.gz
+sha256 ad93048afbd8394d709da35934a62ef5826143b6baa13d37115a3b265f9038b7  mdevd-0.1.1.1.tar.gz
 sha256 2e59eb9754eaece119072a4379d8b320900cc8c4a1a488d2d7788768b95e89ae  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index 603a35731c..48de724924 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.1.0
+MDEVD_VERSION = 0.1.1.1
 MDEVD_SITE = http://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
