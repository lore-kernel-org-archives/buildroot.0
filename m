From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:51:04 +0200
Subject: [Buildroot] [PATCH 09/12] libatomic_ops: add license informations
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/libatomic_ops.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

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
-- 
1.7.9.5
