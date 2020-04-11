From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:03:50 +0200
Subject: [Buildroot] [git commit] package/ser2net: bump to version 4.1.6
Message-ID: <20200411075009.325298E44B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=372740e02c8eb80087ec43c427b96dd1714f4578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 8 ++++----
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 9a61564b0e..1eaad2c584 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5 1a42e9605342fd3d6fa41b48be7f564a  ser2net-4.1.2.tar.gz
-sha1 2a40a94e37d89ca795b3a8f692583c78259383c1  ser2net-4.1.2.tar.gz
+md5  96498fab618ff23ae2791eefc86a5066  ser2net-4.1.6.tar.gz
+sha1  3b31fbbbdab2c658bb0dc19ed93c7d8474ecdd25  ser2net-4.1.6.tar.gz
 # Locally computed:
-sha256 9bdc33476834bbbdcbfbb77ff8f1b1952fe2e7e19dde7e6f7932cea0cec958c7  ser2net-4.1.2.tar.gz
-sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
+sha256  757505db9afc21a448cb008a3b9a9040cdc17c348ef42a55c9e672d4ccf71e9f  ser2net-4.1.6.tar.gz
+sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 08f1fe0c8b..da0aa6c156 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.1.2
+SER2NET_VERSION = 4.1.6
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
