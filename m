From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:34:39 -0800
Subject: [Buildroot] [git commit] imagemagick: add license info
Message-ID: <20121130154710.E169299369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e6d537eb7c4805943a2bceb0e1fb338bbf42ab5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 61a379d..0476ace 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -11,6 +11,9 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
 IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
+IMAGEMAGICK_LICENSE = Apache-v2
+IMAGEMAGICK_LICENSE_FILES = LICENSE
+
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 
