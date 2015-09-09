From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Sep 2015 18:13:55 -0300
Subject: [Buildroot] [PATCH] xtables-addons: bump to version 2.8
Message-ID: <1441833235-20991-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With support for linux kernel 4.2

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xtables-addons/xtables-addons.hash | 6 +++---
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 02e646f..5b60d12 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.7/
-md5	81bd7ba82e5f7bfd1458fc97ddf72e1d	xtables-addons-2.7.tar.xz
-sha1	82c13237ef2a62e57832b160832f4b9c4fb8c7c5	xtables-addons-2.7.tar.xz
+# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.8/
+md5	246ec2f1f75c32c6e04ae9ae75b578c9	xtables-addons-2.8.tar.xz
+sha1	fb3a992e8ff3fe1967b8c6f22eba0c3475aceaf7	xtables-addons-2.8.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index d16341f..687a66a 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.7
+XTABLES_ADDONS_VERSION = 2.8
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
-- 
2.4.6
