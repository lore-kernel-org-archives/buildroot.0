From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Sep 2019 19:18:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/acpid: bump to version 2.0.32
Message-ID: <20190918171818.3648-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acpid/acpid.hash | 8 ++++++--
 package/acpid/acpid.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index 0286219621..f325325b9c 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,3 +1,7 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5	1528040b5d34f8c24ebabd97befbf913	acpid-2.0.30.tar.xz
-sha1	680bbb3fa9cdabb78fb19c6d24bb57224fbbbaed	acpid-2.0.30.tar.xz
+md5	248995264b9d1cd8bdb923d5b190fd44	acpid-2.0.32.tar.xz
+sha1	a194e99c5b596186c7865e7ddfec55dea6d7fc73	acpid-2.0.32.tar.xz
+
+# Locally computed
+sha256	f2d2d30b3edc3234bd82f6f7186699a6aa3c85c8d20bc4e30e9b3c68a1ed157e	acpid-2.0.32.tar.xz
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index adcc1757aa..20295aa5a4 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.30
+ACPID_VERSION = 2.0.32
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
-- 
2.23.0
