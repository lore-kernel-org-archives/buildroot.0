From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:03:51 +0200
Subject: [Buildroot] [git commit] jimtcl: define license
Message-ID: <20130710202005.287AB9A659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e4f6dcb04819ca0dd2b1ebdb77a158488d92de8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jimtcl/jimtcl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5c5cdb3..53cddf9 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -8,6 +8,8 @@ JIMTCL_VERSION = 0.73
 JIMTCL_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/jimtcl
 JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.bz2
 JIMTCL_INSTALL_STAGING = YES
+JIMTCL_LICENSE = BSD-2c
+JIMTCL_LICENSE_FILES = LICENSE
 
 JIMTCL_HEADERS_TO_INSTALL = \
 	jim.h \
