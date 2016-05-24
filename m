From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 May 2016 16:13:39 -0300
Subject: [Buildroot] [PATCH] xtables-addons: bump to version 2.11
Message-ID: <1464117219-8712-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xtables-addons/xtables-addons.hash | 6 +++---
 package/xtables-addons/xtables-addons.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index be8cb6e..323393d 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.10/
-sha1	bc6dcb1eb1328931189f6e73a1a02ef4cc51bc44	xtables-addons-2.10.tar.xz
+# From https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.11/
+sha1	356abeb8ae24da67178f1612bc0fcbfd83a5e7e7	xtables-addons-2.11.tar.xz
 # Calculated based on the hash above
-sha256	2a2d92ae924437d757f55514502c6ef3aeccc6106f729c702efe703ad30f4007	xtables-addons-2.10.tar.xz
+sha256	f14f8953a9d3a70157a82883886ff6ec866c61dbea1585edb421478107279921	xtables-addons-2.11.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index b4e5992..7fc7312 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.10
+XTABLES_ADDONS_VERSION = 2.11
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
-XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
+XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/$(XTABLES_ADDONS_VERSION)
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPLv2+
 XTABLES_ADDONS_LICENSE_FILES = LICENSE
-- 
2.7.3
