From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Nov 2013 09:45:09 +0100
Subject: [Buildroot] [git commit] samba: security bump to version 3.6.20
Message-ID: <20131112114305.C908F9BBF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71879a4e01b510bcaf27b0fcf78966c58819be18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-4475 and CVE-2013-4476.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 76a46b8..834bac3 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.19
+SAMBA_VERSION = 3.6.20
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
