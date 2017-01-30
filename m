From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:15:28 +0100
Subject: [Buildroot] [git commit] samba4: bump to version 4.5.5
Message-ID: <20170130201643.33A627FFF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b504da17f87b51b8e1da7843092ae44b27d9865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch download URL to match the website and avoid issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 1148db2..4fec55d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	1800d10ea14cabef67c83cc56a0f37f4f30ba5df218b3a1e7c874069a08c0f40	samba-4.5.4.tar.gz
+sha256	bff02762b3e4ee030f02266c6e24a0b888248b387246219b7fbe3e1758ef2184	samba-4.5.5.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7eacf8a..4020caa 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.4
-SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
+SAMBA4_VERSION = 4.5.5
+SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPLv3+
