From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Dec 2015 14:27:33 -0300
Subject: [Buildroot] [PATCH] findutils: bump to version 4.6.0
Message-ID: <1451410053-26589-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/findutils/findutils.hash | 2 +-
 package/findutils/findutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 66f1fcc..d5c5519 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a	findutils-4.4.2.tar.gz
+sha256	ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d	findutils-4.6.0.tar.gz
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index c2c4b39..8f6b099 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.4.2
+FINDUTILS_VERSION = 4.6.0
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPLv3+
 FINDUTILS_LICENSE_FILES = COPYING
-- 
2.4.10
