From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 15 Jun 2015 23:33:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpm: add hash file,
	change archive to lzma
Message-ID: <1434404019-13860-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/gpm/gpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index dee6208..6d3b5d2 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GPM_VERSION = 1.20.7
-GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
+GPM_SOURCE = gpm-$(GPM_VERSION).tar.lzma
 GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
 GPM_LICENSE = GPLv2+
 GPM_LICENSE_FILES = COPYING
-- 
1.8.0
