From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:30:30 +0200
Subject: [Buildroot] [git commit] package/phytool: bump version to 2
Message-ID: <20170917162327.2A89B805CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7fb97dcd84f4e85c12327910fd541fd7f87575d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/phytool/phytool.hash | 6 +++---
 package/phytool/phytool.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/phytool/phytool.hash b/package/phytool/phytool.hash
index 37d8f66..ce04936 100644
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
index 2a47dfa..3de6666 100644
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
