From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Sat, 29 May 2010 12:47:04 +0200
Subject: [Buildroot] [PATCH] Bump NcFTP version.
Message-ID: <1275130024-677-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Due to recent 3.2.4 release, 3.2.2 download address has changed, so
I prefered bump version to 3.2.4 rather than changing NCFTP_SITE.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/ncftp/ncftp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 84bfee1..757cc6e 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -3,7 +3,7 @@
 # ncftp client
 #
 #############################################################
-NCFTP_VERSION:=3.2.2
+NCFTP_VERSION:=3.2.4
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
 
-- 
1.6.0.4
