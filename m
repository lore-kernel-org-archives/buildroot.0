From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 16:29:21 +0100
Subject: [Buildroot] [git commit] package/leafnode2: fix SITE url
Message-ID: <20161030152932.9531E817C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ac9823f99a3fbfdeb544396e65d466d4db2b5eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leafnode2/leafnode2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 5b9b854..0c20fd0 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -6,7 +6,7 @@
 
 LEAFNODE2_VERSION = 2.0.0.alpha20140727b
 LEAFNODE2_SOURCE = leafnode-$(LEAFNODE2_VERSION).tar.bz2
-LEAFNODE2_SITE = http://www.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
+LEAFNODE2_SITE = http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
 LEAFNODE2_LICENSE = LGPLv2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
