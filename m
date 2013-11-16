From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 00:53:56 +0100
Subject: [Buildroot] [git commit] Fix typo in url
Message-ID: <20131116235541.5E4A39967B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93adbf9c00671cb5983cfa7b11b04d2d72ab344b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a typo in squashfs site url

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/squashfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
