From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 23:59:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] samba4: bump to version
	4.5.13
Message-ID: <20170904215238.8847C8211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb82c24ce005f216e7b7e475a172127e2a55f253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

4.5.13 is a bugfix release, fixing a number of important issues:

https://www.samba.org/samba/history/samba-4.5.13.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0783b37..0d8b111 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f4c17123e3cc852a5ecc7e38884b00deab57632b9519aebc243e2a94b9b5ace4  samba-4.5.12.tar.gz
+sha256  5fc4762d2259469bfb0067c10f77378cb720f2ebdaf2f37b5ca1918dbe84d04d samba-4.5.13.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4301393..08fa400 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.12
+SAMBA4_VERSION = 4.5.13
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
