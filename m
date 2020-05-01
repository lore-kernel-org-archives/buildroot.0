From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 14:09:53 +0200
Subject: [Buildroot] [git commit] package/ser2net: bump to version 4.1.7
Message-ID: <20200501115500.99DF490C68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2575170cfd478595cb63dbe450238e7f5259c63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 1eaad2c584..91d97e74fc 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  96498fab618ff23ae2791eefc86a5066  ser2net-4.1.6.tar.gz
-sha1  3b31fbbbdab2c658bb0dc19ed93c7d8474ecdd25  ser2net-4.1.6.tar.gz
+md5  504345864f6110d5b6b63ad1f2ba3ed9  ser2net-4.1.7.tar.gz
+sha1  8268c2f7937152a7bbbac6d2f289c257d11deb69  ser2net-4.1.7.tar.gz
 # Locally computed:
-sha256  757505db9afc21a448cb008a3b9a9040cdc17c348ef42a55c9e672d4ccf71e9f  ser2net-4.1.6.tar.gz
+sha256  55bbeeed58eda7514ba7a52d14a930e57e1e5c6fd785a84ca0dd7c3b5615e0a5  ser2net-4.1.7.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index da0aa6c156..1f29e2950e 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.1.6
+SER2NET_VERSION = 4.1.7
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
