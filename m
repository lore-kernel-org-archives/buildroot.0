From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Aug 2016 11:31:17 +0200
Subject: [Buildroot] [PATCH 1/1] gssdp: bump to version 0.99.0
Message-ID: <1472635877-5906-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 485c03f..3738988 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.14/gssdp-0.14.16.sha256sum:
-sha256	54520bfb230b9c8c938eba88d87df44e04749682c95fb8aa381d13441345c5b2	gssdp-0.14.16.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.99/gssdp-0.99.0.sha256sum:
+sha256	29330adea7314fde44b769e01b2ffa1d2d34e8955b0f82f20bfb425d8421bc60	gssdp-0.99.0.tar.xz
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 59f633f..6a61789 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 0.14
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).16
+GSSDP_VERSION_MAJOR = 0.99
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPLv2+
-- 
2.7.4
