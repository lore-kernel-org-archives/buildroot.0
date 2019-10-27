From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:35:06 +0100
Subject: [Buildroot] [git commit] package/libidn2: get rid of remnants of
 using := in LICENSE
Message-ID: <20191027092901.80BE388C71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9bf7d31189d3f18b48ea65e2f4c70b2b72057a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no longer any reason to assign to LICENSE using an
immediate assignment. There was even no reason to use it
either in the first assignment.

Drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libidn2/libidn2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index bd6c559d04..5e05634942 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -6,7 +6,7 @@
 
 LIBIDN2_VERSION = 2.2.0
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
-LIBIDN2_LICENSE := GPL-2.0+ or LGPL-3.0+ (library)
+LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
 LIBIDN2_DEPENDENCIES = \
 	host-pkgconf \
