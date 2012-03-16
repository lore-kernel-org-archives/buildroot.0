From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Mar 2012 22:12:15 +0100
Subject: [Buildroot] [git commit] vsftpd: bump to 2.3.5
Message-ID: <20120316214430.356E990DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ec29c8acc4827d831640f807bb7212072998e0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index e67ab4a..8d3a01e 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-VSFTPD_VERSION = 2.3.4
+VSFTPD_VERSION = 2.3.5
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 
