From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:00:56 +0200
Subject: [Buildroot] [git commit] squashfs: add license information
Message-ID: <20140626151144.3D8E49D0D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13c860202727da415333e4840e9b26faec2731df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/squashfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index aaf568c..58dcb62 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -7,6 +7,8 @@
 SQUASHFS_VERSION = 4.3
 SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
+SQUASHFS_LICENSE = GPLv2+
+SQUASHFS_LICENSE_FILES = COPYING
 
 # no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
