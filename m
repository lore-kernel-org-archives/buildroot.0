From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 21:09:47 +0200
Subject: [Buildroot] [git commit] samba: security bump to version 3.5.15
Message-ID: <20120501191014.4ECF596B6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d51770a0c53f1ddd46fb3c10315734c72ecd070
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for CVE-2012-2111

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 48810b9..1203693 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.5.14
+SAMBA_VERSION = 3.5.15
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
