From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 14:09:47 +0200
Subject: [Buildroot] [git commit] package/gensio: bump to version 2.0.3
Message-ID: <20200501115500.8B9DF90C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=347d18c8026db61cc06d3c55f72755ebe0b90cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index be78696b5a..c9da6f3cdc 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  6676c877275f3475b59f584204d94daa  gensio-2.0.1.tar.gz
-sha1  0624b6ea0c9b939454df1e0265b20fdacd5383b1  gensio-2.0.1.tar.gz
+md5  76466adbd15aae9d0af7207a921935b5  gensio-2.0.3.tar.gz
+sha1  da14b4903e8422745dd6193b41385ad2e1bd1fff  gensio-2.0.3.tar.gz
 # Locally computed:
-sha256  92333a2f0baa3d77a6ff13a81ae165e871d70e8a583882c46363fe4b710c7348  gensio-2.0.1.tar.gz
+sha256  f19cfcef8187a01b0168931c2b80d065c8bba6004e06fab62745ca512374d706  gensio-2.0.3.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 101f2c2574..17388ad3c6 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.0.1
+GENSIO_VERSION = 2.0.3
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
