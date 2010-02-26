From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 10:42:26 +0100
Subject: [Buildroot] [git commit master] libraw1394: fix tarball URL
Message-ID: <20100226094312.DBB577775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c789fbddf491e91b5f3e3b408221117aa04095dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The website of libraw1394 isn't anymore on http://www.linux1394.org.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw1394/libraw1394.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 2dfaadc..045cc82 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -6,7 +6,7 @@
 
 LIBRAW1394_VERSION:=1.2.1
 LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
-LIBRAW1394_SITE:=http://www.linux1394.org/dl
+LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
 LIBRAW1394_DIR:=$(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)
 
 $(DL_DIR)/$(LIBRAW1394_SOURCE):
-- 
1.6.3.3
