From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 17:29:15 +0200
Subject: [Buildroot] [git commit] alsa-utils: needs host-gettext
Message-ID: <20130411152856.CDE2A9B59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36f13ad186f5d7dbfc6a95280f4d16893ef72669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/31ca7306ca345bf057a844eab5b5d711e6c82842/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/alsa-utils/alsa-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 6228574..84082d1 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -10,7 +10,7 @@ ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
-ALSA_UTILS_DEPENDENCIES = alsa-lib \
+ALSA_UTILS_DEPENDENCIES = host-gettext alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
 ALSA_UTILS_CONF_ENV = \
