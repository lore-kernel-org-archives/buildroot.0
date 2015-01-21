From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Jan 2015 21:06:23 -0300
Subject: [Buildroot] [PATCH] patch: bump to version 2.7.2
Message-ID: <1421798783-14923-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patch/patch.hash | 2 ++
 package/patch/patch.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/patch/patch.hash

diff --git a/package/patch/patch.hash b/package/patch/patch.hash
new file mode 100644
index 0000000..77e1ec8
--- /dev/null
+++ b/package/patch/patch.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9a55c7e7415fa789acc45dbe78fe4675b1fa12c1ccb19f1513f69fca3f798a9a	patch-2.7.2.tar.xz
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 2dd4533..059c229 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PATCH_VERSION = 2.7.1
+PATCH_VERSION = 2.7.2
 PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
-- 
2.0.5
