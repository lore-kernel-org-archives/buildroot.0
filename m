From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 11:40:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/phytool: bump version to 2
Message-ID: <20170917094002.14379-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/phytool/phytool.hash | 6 +++---
 package/phytool/phytool.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/phytool/phytool.hash b/package/phytool/phytool.hash
index 37d8f6675f..ce04936417 100644
--- a/package/phytool/phytool.hash
+++ b/package/phytool/phytool.hash
@@ -1,4 +1,4 @@
-# md5 from https://github.com/wkz/phytool/releases/download/v1.0.1/phytool-1.0.1.tar.xz.md5
+# md5 from https://github.com/wkz/phytool/releases/download/v2/phytool-2.tar.xz.md5
 # sha256 locally computed:
-md5  08997ad8f01faf84f3da0638f3ad8b16  phytool-1.0.1.tar.xz
-sha256  b08c538dc8024e542d54742b93cc7748c7062477f060d6e9331a67009aeadd88  phytool-1.0.1.tar.xz
+md5  972982f8e5f7237cbccfc6d275da7348  phytool-2.tar.xz
+sha256  9901a14e8c6af02b7333c60b21ff81f50620e8326d54827185e5617ff9b11d21  phytool-2.tar.xz
diff --git a/package/phytool/phytool.mk b/package/phytool/phytool.mk
index 2a47dfa570..3de6666110 100644
--- a/package/phytool/phytool.mk
+++ b/package/phytool/phytool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHYTOOL_VERSION = 1.0.1
+PHYTOOL_VERSION = 2
 PHYTOOL_SOURCE = phytool-$(PHYTOOL_VERSION).tar.xz
 PHYTOOL_SITE = https://github.com/wkz/phytool/releases/download/v$(PHYTOOL_VERSION)
 PHYTOOL_LICENSE = GPL-2.0+
-- 
2.11.0
