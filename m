From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 12:23:01 +0100
Subject: [Buildroot] [git commit] samba: security bump to version 3.6.12
Message-ID: <20130205114043.BC01D9A964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b93bc6ebdcbae89547dc89dbce4701ea8037e02b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-0213

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 4eb6a33..b31787b 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.6.11
+SAMBA_VERSION = 3.6.12
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
