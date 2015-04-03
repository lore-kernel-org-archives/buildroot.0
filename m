From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 00:18:22 +0200
Subject: [Buildroot] [git commit] wine: 1.6.2 has no netapi configure option
Message-ID: <20150403221841.872A681774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cf1c626701db5df27cfcf7b14498bb03b177084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 188c7cc..c201186 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -23,7 +23,6 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
-	--without-netapi \
 	--without-openal \
 	--without-opencl \
 	--without-osmesa \
@@ -304,7 +303,6 @@ HOST_WINE_CONF_OPTS += \
 	--without-jpeg \
 	--without-ldap \
 	--without-mpg123 \
-	--without-netapi \
 	--without-openal \
 	--without-opencl \
 	--without-opengl \
