From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 17:35:33 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.21p2
Message-ID: <20170922153708.1C8BD81050@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a41d44a8c93b63e8ba2da32b1680333f77ec1452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch SITE to https.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ea0764c..80448ff 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 bd42ae1059e935f795c69ea97b3de09fe9410a58a74b5d5e6836eb5067a445d9  sudo-1.8.20p2.tar.gz
+sha256 74c5746cd33a814e2431c39faf0d76f7f8a697379bd073862e3b156cf0d76368  sudo-1.8.21p2.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9cca544..77a95bd 100644
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
