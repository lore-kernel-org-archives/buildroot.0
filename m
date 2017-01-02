From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jan 2017 13:02:26 -0300
Subject: [Buildroot] [PATCH] xz: bump to version 5.2.3
Message-ID: <20170102160226.26607-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.hash | 2 +-
 package/xz/xz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index f723f7e..20a4a47 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 6ff5f57a4b9167155e35e6da8b529de69270efb2b4cf3fbabf41a4ee793840b5  xz-5.2.2.tar.bz2
+sha256 fd9ca16de1052aac899ad3495ad20dfa906c27b4a5070102a2ec35ca3a4740c1  xz-5.2.3.tar.bz2
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 5e1d7c6..40adb3d 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.2
+XZ_VERSION = 5.2.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
-- 
2.10.2
