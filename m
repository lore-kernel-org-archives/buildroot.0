From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Jun 2013 08:44:26 +0200
Subject: [Buildroot] [git commit] tiff: add license info
Message-ID: <20130604065154.8BF3B9A5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69f323f562507c86d4d073086d1d9d6ff2c11e5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tiff/tiff.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e881647..bcc55be 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -6,6 +6,8 @@
 
 TIFF_VERSION = 4.0.3
 TIFF_SITE = http://download.osgeo.org/libtiff
+TIFF_LICENSE = tiff license
+TIFF_LICENSE_FILES = COPYRIGHT
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPT = \
 	--disable-cxx \
