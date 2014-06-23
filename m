From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jun 2014 16:19:56 +0200
Subject: [Buildroot] [git commit] samba: security bump to version 3.6.24
Message-ID: <20140623142129.383DC9D09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78e38f568dd27ca7f2fadaf39d614770ed238d1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-0244 (Denial of service - CPU loop)
CVE-2014-3493 (Denial of service - Server crash/memory corruption)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 7d5ed5e..6d379b5 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.23
+SAMBA_VERSION = 3.6.24
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
