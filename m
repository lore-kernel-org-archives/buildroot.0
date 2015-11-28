From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:12:46 +0100
Subject: [Buildroot] [git commit branch/next] libplist: download from the
	official project website and use a tar.bz2
Message-ID: <20151128181404.AA1807FEB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4d337d736f091f26c3a9a5e3a525d70c26e02cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplist/libplist.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index b87c5ba..7f60b5e 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBPLIST_VERSION = 1.12
-LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
+LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
+LIBPLIST_SITE = http://www.libimobiledevice.org/downloads
 LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
 LIBPLIST_INSTALL_STAGING = YES
 LIBPLIST_LICENSE = LGPLv2.1+
