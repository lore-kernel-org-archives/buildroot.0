From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:45:33 +0200
Subject: [Buildroot] [git commit] gssdp: bump to version 1.0.1
Message-ID: <20161029134548.2C1938020E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b37b5f5d39896fc76e9e3231247c4f2e5d560cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 3738988..b646d18 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.99/gssdp-0.99.0.sha256sum:
-sha256	29330adea7314fde44b769e01b2ffa1d2d34e8955b0f82f20bfb425d8421bc60	gssdp-0.99.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.1.sha256sum:
+sha256	601d67f40bc28c067742b7c46f3018da96b364fd3e83f30ddac6e190e323d2e1	gssdp-1.0.1.tar.xz
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 6a61789..fa44a2c 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 0.99
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0
+GSSDP_VERSION_MAJOR = 1.0
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPLv2+
