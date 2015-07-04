From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 12:42:15 +0200
Subject: [Buildroot] [git commit] package/kodi: Remove hyperflous option
	--disable-dvdcss
Message-ID: <20150704104248.5B1B480DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81a66756ca230c719d9e7f9cf303059659711543
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option is controlled later on inside this if-clause

ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 8712b12..f95d20d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -34,7 +34,6 @@ KODI_CONF_ENV = \
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
 	--disable-crystalhd \
-	--disable-dvdcss \
 	--disable-hal \
 	--disable-joystick \
 	--disable-openmax \
