From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jan 2017 20:36:09 -0300
Subject: [Buildroot] [PATCH v2] xtables-addons: bump to version 2.12
Message-ID: <20170116233609.2425-1-gustavo@zacarias.com.ar>
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
index 323393d..9aa9c0e 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.11/
-sha1	356abeb8ae24da67178f1612bc0fcbfd83a5e7e7	xtables-addons-2.11.tar.xz
+# From https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/
+sha1	70ace437ec84d9ec1970505cecf270ed0cbd273e	xtables-addons-2.12.tar.xz
 # Calculated based on the hash above
-sha256	f14f8953a9d3a70157a82883886ff6ec866c61dbea1585edb421478107279921	xtables-addons-2.11.tar.xz
+sha256	c4865aa1c64c5ff173ff7b5d69425466c71f0f9b5eb5299c52c68bdcd46fa63b	xtables-addons-2.12.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 54d1517..274e681 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.11
+XTABLES_ADDONS_VERSION = 2.12
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
-XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/$(XTABLES_ADDONS_VERSION)
+XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPLv2+
 XTABLES_ADDONS_LICENSE_FILES = LICENSE
-- 
2.10.2
