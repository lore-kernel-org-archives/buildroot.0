From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 14:16:01 +0100
Subject: [Buildroot] [git commit] package/liboauth: fix broken download URL
Message-ID: <20160201224702.87E287F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60ac224200bfae3192d494517b3e5e84a3e57f35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liboauth/liboauth.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 3b482bf..bd54330 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBOAUTH_VERSION = 1.0.3
-LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
+LIBOAUTH_SITE = http://downloads.sourceforge.net/project/liboauth
 LIBOAUTH_INSTALL_STAGING = YES
 LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
 LIBOAUTH_LICENSE = MIT
