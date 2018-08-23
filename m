From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:29:07 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/samba4: security
 bump to version 4.8.4
Message-ID: <20180824063605.4B9E988791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f316cb091b115821797289f2992d8380912c0ef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Release notes: https://www.samba.org/samba/history/samba-4.8.4.html

Fixes

o  CVE-2018-1139  (Weak authentication protocol allowed.)
o  CVE-2018-1140  (Denial of Service Attack on DNS and LDAP server.)
o  CVE-2018-10858 (Insufficient input validation on client directory
                   listing in libsmbclient.)
o  CVE-2018-10918 (Denial of Service Attack on AD DC DRSUAPI server.)
o  CVE-2018-10919 (Confidential attribute disclosure from the AD LDAP
                   server.)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3d7ce0124aa6ab116f430604db72c99bcd7a299a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4b1b1218ac..00c8466078 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.3.tar.asc
-sha256 e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f21387ef253010b82ed  samba-4.8.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.4.tar.asc
+sha256 f5044d149e01894a08b1d114b8b69aed78171a7bb19608bd1fd771453b9a5406  samba-4.8.4.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 52d59ffeb9..03ef6eeeb0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.3
+SAMBA4_VERSION = 4.8.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
