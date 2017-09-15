From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Sep 2017 07:49:20 +0300
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.21p2
Message-ID: <8fcce9df65ba8406cddd37212379aee8923790ea.1505450960.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch SITE to https.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ea0764c15716..80448ff7928b 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 bd42ae1059e935f795c69ea97b3de09fe9410a58a74b5d5e6836eb5067a445d9  sudo-1.8.20p2.tar.gz
+sha256 74c5746cd33a814e2431c39faf0d76f7f8a697379bd073862e3b156cf0d76368  sudo-1.8.21p2.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9cca544b1b30..77a95bd65e8c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.20p2
-SUDO_SITE = http://www.sudo.ws/sudo/dist
+SUDO_VERSION = 1.8.21p2
+SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
 # This is to avoid sudo's make install from chown()ing files which fails
-- 
2.14.1
