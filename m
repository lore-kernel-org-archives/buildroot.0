From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:15:46 +0200
Subject: [Buildroot] [git commit] libatomic_ops: add license informations
Message-ID: <20130512202409.92E5A9A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5d5b097a42afeda02ca93b7e83d17d4dbde02c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libatomic_ops/libatomic_ops.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 8f66f88..10db272 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -7,6 +7,16 @@
 LIBATOMIC_OPS_VERSION = 7.2
 LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
 LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
+
+# From doc/LICENSING.txt: "Our intent is to make it easy to use
+# libatomic_ops, in both free and proprietary software.  Hence most
+# code that we expect to be linked into a client application is
+# covered by an MIT-style license. A few library routines are covered
+# by the GNU General Public License. These are put into a separate
+# library, libatomic_ops_gpl.a."
+LIBATOMIC_OPS_LICENSE = MIT (main library) / GPLv2+ (gpl extension)
+LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt doc/COPYING
+
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
