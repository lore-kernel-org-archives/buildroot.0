From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 May 2017 20:38:56 +0200
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.5.9
Message-ID: <20170601202852.47E328261C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca1d9c3a89f38995d1788b1b3d56239cbc890447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see the release notes:
https://www.samba.org/samba/history/samba-4.5.9.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0a2a548..c0ac04a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f63b656d8823a280c50c9dbd6b692816cd7a88adfe9b47997ce697fd75bf81f0  samba-4.5.8.tar.gz
+sha256 e7b04b5d7ce10ed1205cc552200958e3c487ecf9647ea4c7b8c5f049f97c6be4  samba-4.5.9.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4de69a0..209d8ef 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.8
+SAMBA4_VERSION = 4.5.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
