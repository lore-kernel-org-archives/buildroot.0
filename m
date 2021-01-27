From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2021 21:59:31 +0100
Subject: [Buildroot] [git commit] package/xtables-addons: bump version to
 3.13
Message-ID: <20210127204009.E9A19815BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ac567c1b91c3be7c878dd107ecbb78e4adc026d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use https://inai.de/files/xtables-addons to download source code

Signed-off-by: Eldar Gasanov <eldargasanov2@gmail.com>
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Peter: also update Config.in URL]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/Config.in           | 2 +-
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
index 39fafe72b7..36a42c7efc 100644
--- a/package/xtables-addons/Config.in
+++ b/package/xtables-addons/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_XTABLES_ADDONS
 	  Likewise, it contains extensions that were not, or are not
 	  yet, accepted in the main kernel/iptables packages.
 
-	  http://xtables-addons.sourceforge.net/
+	  https://inai.de/projects/xtables-addons/
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
