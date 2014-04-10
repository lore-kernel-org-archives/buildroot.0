From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:21:25 +0200
Subject: [Buildroot] [git commit] mtd: bump to version 1.5.1
Message-ID: <20140410204503.D83439C6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6afbd005c0b50b01b598d4376670248a2591a26e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6b2af0d..9dde40a 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 1.5.0
+MTD_VERSION = 1.5.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPLv2
