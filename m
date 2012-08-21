From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:41:09 +0200
Subject: [Buildroot] [git commit] zxing: add license information
Message-ID: <20120821110312.48D0E97206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3dc53ca247a156b20c2a4e8d2dc5222bae183a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zxing/zxing.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 54383e7..543d038 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -6,6 +6,8 @@
 ZXING_VERSION = 2.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
+ZXING_LICENSE = Apache
+ZXING_LICENSE_FILES = COPYING
 ZXING_INSTALL_STAGING = YES
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
