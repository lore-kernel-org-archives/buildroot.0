From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 22:02:16 +0200
Subject: [Buildroot] [git commit] lftp: bump to last version 4.4.16
Message-ID: <20140602200240.3E9179CE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92501f8a25f585bd93a7972cc1915a3a364292e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lftp/lftp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 5c6fd4b..244ebde 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.4.15
+LFTP_VERSION = 4.4.16
 LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
