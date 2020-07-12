From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:39:12 +0200
Subject: [Buildroot] [git commit] package/keepalived: bump to version 2.1.4
Message-ID: <20200712213538.151E482B8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eb5c221fd1d90ae9be3b32b2e23070affe74295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix a build failure with kernel 4.15 thanks to:
https://github.com/acassen/keepalived/commit/d47ae3b1c853adefb9680ba31cf05c037d844445

Fixes:
 - http://autobuild.buildroot.org/results/db7f149f63e9180b22460caa74850673362aa17c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.hash | 2 +-
 package/keepalived/keepalived.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index feac0cce61..94af43c3e6 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fdf57a5766f52bd7f7bb917e06baede2e81efb96060b4dd1714170fbca32d58f  keepalived-2.1.2.tar.gz
+sha256  245bf399e4320064996ac5507236a8896f545d005f6c4c3b91701bcbc5728c60  keepalived-2.1.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index c67eda3709..2c78b2d811 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 2.1.2
+KEEPALIVED_VERSION = 2.1.4
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
