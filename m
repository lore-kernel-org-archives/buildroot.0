From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:18:56 +0200
Subject: [Buildroot] [git commit] package/lbreakout2: bump version to 2.6.5
Message-ID: <20170725201452.3125282150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82a7409c7af7ff83b5d1d4b39788928c169eed5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to https, added upstream md5 & sha1 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lbreakout2/lbreakout2.hash | 5 ++++-
 package/lbreakout2/lbreakout2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/lbreakout2/lbreakout2.hash b/package/lbreakout2/lbreakout2.hash
index d9638b4..0d305dc 100644
--- a/package/lbreakout2/lbreakout2.hash
+++ b/package/lbreakout2/lbreakout2.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/lgames/files/lbreakout2/2.6/
+md5 1a9238b83f9f13f09b7a4d53e00b4e84  lbreakout2-2.6.5.tar.gz
+sha1 d92326499165fd368be04378d633e13d42b4d2d7  lbreakout2-2.6.5.tar.gz
 # Locally computed:
-sha256  0b90716d52e67c27ff41ab7aa5c09dad4f5f19a78076cc57dd4b4d7ed2c1dbd9  lbreakout2-2.6.4.tar.gz
+sha256 9104d6175553da3442dc6a5fc407a669e2f5aff3eedc5d30409eb003b7a78d6f  lbreakout2-2.6.5.tar.gz
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index 274c534..49db8d5 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LBREAKOUT2_VERSION_MAJOR = 2.6
-LBREAKOUT2_VERSION = $(LBREAKOUT2_VERSION_MAJOR).4
-LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/$(LBREAKOUT2_VERSION_MAJOR)
+LBREAKOUT2_VERSION = $(LBREAKOUT2_VERSION_MAJOR).5
+LBREAKOUT2_SITE = https://downloads.sourceforge.net/lgames/lbreakout2/$(LBREAKOUT2_VERSION_MAJOR)
 LBREAKOUT2_LICENSE = GPL-2.0+
 LBREAKOUT2_LICENSE_FILES = COPYING
 
