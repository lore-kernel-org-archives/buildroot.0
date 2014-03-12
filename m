From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 17:23:38 +0100
Subject: [Buildroot] [git commit] samba: security bump to version 3.6.23
Message-ID: <20140312162502.3ED2B9BF2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42dcbd07eb632b5c5b632864cd4b4d6a8edbc1d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-4496 and CVE-2013-6442.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 1f1d253..7d5ed5e 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.22
+SAMBA_VERSION = 3.6.23
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
