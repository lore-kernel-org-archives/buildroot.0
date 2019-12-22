From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:07:37 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/matchbox-desktop:
 remove unrecognized option
Message-ID: <20191222204333.D45868D784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c44f1b52f7dad721dca7d0eb8ba81d069456d51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

--enable-expat is not a recognized option so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4022d0d28b87c57789a1a53759bf54c1a1246443)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-desktop/matchbox-desktop.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/matchbox-desktop/matchbox-desktop.mk b/package/matchbox-desktop/matchbox-desktop.mk
index 81b13c079c..9054dd80c6 100644
--- a/package/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox-desktop/matchbox-desktop.mk
@@ -11,7 +11,6 @@ MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matc
 MATCHBOX_DESKTOP_LICENSE = GPL-2.0+
 MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
-MATCHBOX_DESKTOP_CONF_OPTS = --enable-expat
 
 # The bundled configure script does not properly replace LIBADD_DL, so
 # we force an autoreconf even if we don't have any patches touching
