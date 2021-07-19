From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:08:31 +0200
Subject: [Buildroot] [git commit] package/openal: bump to version 1.21.1
Message-ID: <20210719203514.4FF9288429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=0d97fe503d0902e0a6aae1014dc760f4496b7dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 1592dd56b5..3f1a574e3e 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c32d10473457a8b545aab50070fe84be2b5b041e1f2099012777ee6be0057c13  openal-1.20.1.tar.gz
+sha256  8ac17e4e3b32c1af3d5508acfffb838640669b4274606b7892aa796ca9d7467f  openal-1.21.1.tar.gz
 sha256  d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index ed63abfb3f..a878e4847f 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.20.1
-OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
+OPENAL_VERSION = 1.21.1
+OPENAL_SITE = $(call github,kcat,openal-soft,$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
