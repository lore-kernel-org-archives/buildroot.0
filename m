From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 08:56:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/ed: add ED_CPE_ID_VENDOR
Message-ID: <20210111075612.1283686-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ed/ed.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index deb900e283..1b299781d0 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -9,6 +9,7 @@ ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-3.0+
 ED_LICENSE_FILES = COPYING
+ED_CPE_ID_VENDOR = gnu
 
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
-- 
2.29.2
