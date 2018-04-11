From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 16:40:42 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] samba4: security bump to
 version 4.5.16
Message-ID: <20180411154834.0FF3F88454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=933b01bde6c194ccd1c5019af057bcbba452c588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

CVE-2018-1050: Vulnerability to a denial of service attack when the RPC
spoolss service is configured to be run as an external daemon.

https://www.samba.org/samba/security/CVE-2018-1050.html

CVE-2018-1057: Authenticated users might change any other users'
passwords, including administrative users and privileged service
accounts (eg Domain Controllers).

https://www.samba.org/samba/security/CVE-2018-1057.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cddecd9f48..65d8d68ddf 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  811bf727892a1e1e3d170eb72eb39c43d06ed8ff557e5e036a41aabc19008e94 samba-4.5.15.tar.gz
+sha256  3a3356faab1694680e2ccd7fdf051ab1bbd3b0d058fc1f671e135dd2d1eae1aa samba-4.5.16.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4e7dc5b7da..bb77b23fb1 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.15
+SAMBA4_VERSION = 4.5.16
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
