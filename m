From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:24:31 +0200
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.13
Message-ID: <20200714132047.5227D86130@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f19ae64f6769b41168faa3da7c7c9904020e1f02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:

 - Added support for --version
 - Updated systemd SystemCallFilter settings

See https://github.com/jirka-h/haveged/releases/tag/v1.9.13

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 1394b0440a..df8c48e214 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b8642515ea7189a1772cdb8072b98a6768cf9b963faf3cd664329fd79975ffa  haveged-1.9.12.tar.gz
+sha256  d17bd22fa1745daca5ac72e014ed3b0fe5720da4c115953124b1bf2a0aa2b04b  haveged-1.9.13.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index d7b5191a6f..924b499fa9 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.12
+HAVEGED_VERSION = 1.9.13
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
