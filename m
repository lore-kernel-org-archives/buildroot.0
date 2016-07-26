From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:31:15 +0200
Subject: [Buildroot] [git commit] gssdp: bump to version 0.14.16
Message-ID: <20160726193210.144C482119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ee00d53d7b88a4ee2c68ebfb4d7449b89d62251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index fe7d981..485c03f 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.14/gssdp-0.14.14.sha256sum:
-sha256	685718755b5b8d24aaeadda44047e515443784712891fc53879ab9a4865b48d6	gssdp-0.14.14.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.14/gssdp-0.14.16.sha256sum:
+sha256	54520bfb230b9c8c938eba88d87df44e04749682c95fb8aa381d13441345c5b2	gssdp-0.14.16.tar.xz
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 6ba1252..59f633f 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 0.14
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).14
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).16
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPLv2+
