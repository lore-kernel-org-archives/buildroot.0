From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 16:30:37 +0100
Subject: [Buildroot] [git commit master] ser2net: bump version
Message-ID: <20100128153324.6E2B8776A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=62a4149250f42539e8300b9391ce1e0e8bf114ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ser2net/ser2net.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 3bfe8e3..9c3d136 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SER2NET_VERSION = 2.6
+SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
 SER2NET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ser2net
 
-- 
1.6.3.3
