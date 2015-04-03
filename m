From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  3 Apr 2015 09:29:20 -0300
Subject: [Buildroot] [PATCH] webp: bump to version 0.4.3
Message-ID: <1428064160-9888-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webp/webp.hash | 2 ++
 package/webp/webp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/webp/webp.hash

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
new file mode 100644
index 0000000..328f263
--- /dev/null
+++ b/package/webp/webp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4	libwebp-0.4.3.tar.gz
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 1fece6d..5f2cab7 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.3.1
+WEBP_VERSION = 0.4.3
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
-WEBP_SITE = https://webp.googlecode.com/files
+WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3c
 WEBP_LICENSE_FILES = COPYING
 WEBP_INSTALL_STAGING = YES
-- 
2.0.5
