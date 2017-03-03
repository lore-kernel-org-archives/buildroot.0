From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 21:49:02 +0100
Subject: [Buildroot] [git commit] package/memtool: fix trailing /
Message-ID: <20170303204911.8AFC7822B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=949e97bca088b5a59ac87439330555eeab3fe437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memtool/memtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/memtool/memtool.mk b/package/memtool/memtool.mk
index 59b864c..f641627 100644
--- a/package/memtool/memtool.mk
+++ b/package/memtool/memtool.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MEMTOOL_VERSION = 2016.10.0
-MEMTOOL_SITE = http://public.pengutronix.de/software/memtool/
+MEMTOOL_SITE = http://public.pengutronix.de/software/memtool
 MEMTOOL_SOURCE = memtool-$(MEMTOOL_VERSION).tar.xz
 MEMTOOL_LICENSE = GPLv2
 MEMTOOL_LICENSE_FILES = COPYING
