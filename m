From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Jun 2016 20:09:03 -0300
Subject: [Buildroot] [PATCH] libfuse: bump to version 2.9.7
Message-ID: <1466550543-8385-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/libfuse.hash | 2 +-
 package/libfuse/libfuse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index d00d723..60bdf63 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0cb48bbc7106632d15a0c6bb582496c9884b869e329428891fe075a9e916f16b	fuse-2.9.6.tar.gz
+sha256	832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874	fuse-2.9.7.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 1709b56..57aabcd 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.6
+LIBFUSE_VERSION = 2.9.7
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
-- 
2.7.3
