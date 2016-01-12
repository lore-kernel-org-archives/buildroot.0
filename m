From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:39:14 +0100
Subject: [Buildroot] [git commit] samba4: bump to version 4.3.4
Message-ID: <20160112204022.D01C581ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b6207a8f6bafa864734c1a15149c68944a6ef3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 494ad17..f42e37a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e62d21313acbb29e24b0b80aaf2b63fdd1ccce4cfb741f333deca95a1a3a70df	samba-4.3.3.tar.gz
+sha256	5d0eb52e842832af922f7d57716eacff23192906ec3bdf6727e18ca24f1419d9	samba-4.3.4.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 50a2692..4e796a6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.3
+SAMBA4_VERSION = 4.3.4
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
