From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 27 Jan 2021 10:48:36 +0300
Subject: [Buildroot] [PATCH 1/1] package/xtables-addons: bump version to 3.13
Message-ID: <20210127074836.1267071-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eldar Gasanov <eldargasanov2@gmail.com>

Use https://inai.de/files/xtables-addons to download source code

Signed-off-by: Eldar Gasanov <eldargasanov2@gmail.com>
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 33cc139b36..2cfb91178e 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  064dd68937d98e6cfcbdf51ef459310d9810c17ab31b21285bc7a76cdcef7c49  xtables-addons-3.9.tar.xz
+sha256  893c0c4ea09759cda1ab7e68f1281d125e59270f7b59e446204ce686c6a76d65  xtables-addons-3.13.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index c9e5bfdde0..55e1a5d01b 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.9
+XTABLES_ADDONS_VERSION = 3.13
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
-XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
+XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPL-2.0+
 XTABLES_ADDONS_LICENSE_FILES = LICENSE
-- 
2.29.2
