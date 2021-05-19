From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 17:36:30 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/thermald: add
 THERMALD_CPE_ID_VENDOR
Message-ID: <20210519150758.5541F886E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=322c96467ae6e94cfc2f9b6f20c1b3e17d82e25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:intel:thermald is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aintel%3Athermald

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4e48f5da05bd2548bf0f497fe3d6671094d34c18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thermald/thermald.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 98e9c361e5..5619258c44 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -12,6 +12,7 @@ THERMALD_DEPENDENCIES = dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
+THERMALD_CPE_ID_VENDOR = intel
 THERMALD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
