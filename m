From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 14:04:35 -0300
Subject: [Buildroot] [PATCH 1/3] gssdp: bump to version 0.14.14
Message-ID: <1455123877-9983-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Which also means moving from unstable->stable (odd numbers on gnome
project packages are development).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 09b8532..fe7d981 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.13/gssdp-0.13.2.sha256sum:
-sha256 8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e37e51579caa34dce  gssdp-0.13.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.14/gssdp-0.14.14.sha256sum:
+sha256	685718755b5b8d24aaeadda44047e515443784712891fc53879ab9a4865b48d6	gssdp-0.14.14.tar.xz
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index d9459a1..6ba1252 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 0.13
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
+GSSDP_VERSION_MAJOR = 0.14
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).14
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPLv2+
-- 
2.4.10
