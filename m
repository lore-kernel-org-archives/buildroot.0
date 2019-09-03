From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/autofs: bump to version 5.1.5
Message-ID: <20190903133620.7D3208A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd9cf604b56bf04ff1961e1c6759664505905fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/autofs/autofs.hash | 6 +++++-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 1f2060bdef..e4c1ecaeb2 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,2 +1,6 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 8fce30ee51ffd528fe1a4e8374ef57f43367e1f123030e175fb1b1cf15bc1722  autofs-5.1.4.tar.xz
+sha256 23afdad9e2fd6d41b1900be8cfecfd5aae0ad174c7708ff685ec27e280f9c0da  autofs-5.1.5.tar.xz
+
+# Hash for license files
+sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256 2ac2e352a92629e3abcdddbd3eeec64e7c2f5b58b6e819ff2c1444fb6e249fa3  COPYRIGHT
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index e7c65ef4b0..12c7733d01 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.4
+AUTOFS_VERSION = 5.1.5
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
