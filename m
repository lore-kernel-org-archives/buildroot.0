From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 5 Sep 2014 16:13:59 +0100
Subject: [Buildroot] [PATCH] lftp: bump to version 4.5.5
Message-ID: <1409930039-28762-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/lftp/lftp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index ac0f63b..34e50b3 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.5.2
+LFTP_VERSION = 4.5.5
 LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
-- 
1.7.1
