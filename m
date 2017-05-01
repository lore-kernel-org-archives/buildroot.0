From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 09:17:16 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/samba4: bump
	version to 4.5.8
Message-ID: <20170501072636.78F62821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eac5d8c01d2e338ecc46f2da692365800033ce4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Version bump includes a regression fix:
https://www.samba.org/samba/history/samba-4.5.8.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 67c25f897dd61802ea97c83619ca5dace8ba7c27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 71d24f7..0a2a548 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ac70f09af80639d8189e1b9bc0a554841ee44df2b1ef58e7e682ad5400fd9400	samba-4.5.7.tar.gz
+sha256 f63b656d8823a280c50c9dbd6b692816cd7a88adfe9b47997ce697fd75bf81f0  samba-4.5.8.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index aa7cb57..741fb41 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.7
+SAMBA4_VERSION = 4.5.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
