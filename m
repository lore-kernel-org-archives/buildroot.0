From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Sat, 16 Nov 2013 23:07:54 +0100
Subject: [Buildroot] [squashfs] Fix typo in url
Message-ID: <1384639674-15170-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a typo in squashfs site url

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
 package/squashfs/squashfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 04a26c6..bff308c 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -6,7 +6,7 @@
 
 SQUASHFS_VERSION = 4.2
 SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
-SQUASHFS_SITE = http://downloads.sourceforge.net/projct/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
+SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
 
 # no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
-- 
1.8.3.1
