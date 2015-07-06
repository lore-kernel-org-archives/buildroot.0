From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jul 2015 15:06:38 -0300
Subject: [Buildroot] [PATCH] xtables-addons: bump to version 2.7
Message-ID: <1436205998-6710-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build issues with kernels 4.1+

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xtables-addons/xtables-addons.hash | 6 +++---
 package/xtables-addons/xtables-addons.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index d742aed..02e646f 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.6/
-md5	087835ba7e564481b6fd398692268340	xtables-addons-2.6.tar.xz
-sha1	10586961a70fd4fe4f972cb3f31962c6766b359c	xtables-addons-2.6.tar.xz
+# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.7/
+md5	81bd7ba82e5f7bfd1458fc97ddf72e1d	xtables-addons-2.7.tar.xz
+sha1	82c13237ef2a62e57832b160832f4b9c4fb8c7c5	xtables-addons-2.7.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index dcfbd5e..75e2a5a 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.6
+XTABLES_ADDONS_VERSION = 2.7
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
-XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/$(XTABLES_ADDONS_VERSION)
+XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPLv2+
 XTABLES_ADDONS_LICENSE_FILES = LICENSE
-- 
2.3.6
