From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 21:26:41 +0100
Subject: [Buildroot] [git commit branch/next] samba4: bump to version 4.3.5
Message-ID: <20160223203834.ABE75817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf5ac0e76cc20aac6278e4031eeced236b8f0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index f42e37a..1b53657 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5d0eb52e842832af922f7d57716eacff23192906ec3bdf6727e18ca24f1419d9	samba-4.3.4.tar.gz
+sha256	583f927a823b272757fd4df0be267bd20a223b06cfc3c662df17e4870f14bf1c	samba-4.3.5.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4e796a6..64f9957 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.4
+SAMBA4_VERSION = 4.3.5
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
