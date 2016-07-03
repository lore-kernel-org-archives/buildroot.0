From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:17:07 +0200
Subject: [Buildroot] [git commit] lzop: add explicit dependencies for host
	variant
Message-ID: <20160703072403.1EEBA81E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=316547afb600183b6ce06d71188a1649dc7a3bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzop/lzop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1b6a7e1..43c1628 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -9,6 +9,7 @@ LZOP_SITE = http://www.lzop.org/download
 LZOP_LICENSE = GPLv2+
 LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
+HOST_LZOP_DEPENDENCIES = host-lzo
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
