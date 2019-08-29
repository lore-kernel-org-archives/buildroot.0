From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:16:56 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/vte: needs
 host-intltool
Message-ID: <20190829211318.50BA788513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97afc27e1dcf6a52f3c30dc04b88d58fa79bad1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/30a8032ebba5a30bacd321c407a1d0734fadf757

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 82fc6379f05668394cc8f9b573ed176ab762aa2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vte/vte.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 90853cb4a5..7332a1ae04 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -7,7 +7,7 @@
 VTE_VERSION = 0.48.3
 VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
 VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
-VTE_DEPENDENCIES = host-pkgconf libgtk3 libxml2 pcre2
+VTE_DEPENDENCIES = host-intltool host-pkgconf libgtk3 libxml2 pcre2
 VTE_LICENSE = LGPL-2.1+
 VTE_LICENSE_FILES = COPYING
 VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
