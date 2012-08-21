From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 13:00:23 +0200
Subject: [Buildroot] [git commit] librsync: add license info
Message-ID: <20120821110312.AAA1E97206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e791336584a0c751604c77480dcb83c9c367745
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsync/librsync.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 864297b..f0f543f 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -6,6 +6,8 @@
 LIBRSYNC_VERSION:=0.9.7
 LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
 LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/librsync/
+LIBRSYNC_LICENSE = LGPLv2.1+
+LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
