From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 23:59:30 +0200
Subject: [Buildroot] [git commit] lftp: bump to version 4.5.2
Message-ID: <20140618220023.727979D046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d12baed614b0cbd9a6c7c87a2220d663c0b9a94f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lftp/lftp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 244ebde..431fadb 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.4.16
+LFTP_VERSION = 4.5.2
 LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
