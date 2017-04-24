From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 15:44:25 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/dovecot: bump
	version to 2.2.28
Message-ID: <20170424193336.B753F800A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b937e29052b8a8519e62d96a5d787c003bb32b6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 87b60b2586b44f81ada7e57768ca5dded612ffdc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e7b9c33..b52ea8d 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 897f92a87cda4b27b243f8149ce0ba7b7e71a2be8fb7994eb0a025e54cde18e9  dovecot-2.2.27.tar.gz
+sha256 e0288f59e326ab87cb3881fdabadafe542f4dc7ab9996db13863a439ebbc1f25  dovecot-2.2.28.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index fe0afa5..caa6bba 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).27
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).28
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
