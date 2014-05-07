From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 14:29:13 +0200
Subject: [Buildroot] [git commit] libjpeg: add license information
Message-ID: <20140507122949.9D9A09CB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53f208b8413c2f7e6e0d651affbb4e17865b1149
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index a5898a4..dc38a7c 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -7,6 +7,8 @@
 LIBJPEG_VERSION = 8d
 LIBJPEG_SITE = http://www.ijg.org/files/
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
+LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
+LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
