From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 08:40:09 +0200
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.6.6
Message-ID: <20170802152748.078427FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a160a7b984695f53f08b48c7204dc2b845bc22af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0783b37..a2a0cd3 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f4c17123e3cc852a5ecc7e38884b00deab57632b9519aebc243e2a94b9b5ace4  samba-4.5.12.tar.gz
+sha256 fc31c809f7d85ae30f2b7dcddcb8404201b626047458cb5f2b743d4f6f3f1a8e  samba-4.6.6.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3dbb261..67b00b9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.12
+SAMBA4_VERSION = 4.6.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
