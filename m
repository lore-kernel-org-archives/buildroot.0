From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Oct 2020 05:44:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 0.20.3
Message-ID: <20201001034403.45588-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed md5 hash.

Release notes:
http://stellarium.org/release/2020/09/27/stellarium-0.20.3.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/stellarium/stellarium.hash | 5 ++---
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 7f29290aee..4f0ee7e12f 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,6 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-md5  12b87785efdc52c1682bb6f3c37bd85d  stellarium-0.20.2.tar.gz
-sha1  308fd0878d2126878d769d66cac1f00b3dccf819   stellarium-0.20.2.tar.gz
-sha256 400ef964c2a1612157a4b219464ea919b4e330322a0db894835b6e11c4af5e9b  stellarium-0.20.2.tar.gz
+sha1  a3de40d74b2dcf8c9a7c6220de3d9e951e5b06c8    stellarium-0.20.3.tar.gz
+sha256 2781a364d14c203c21a11ef528d541559ed749e1b6c3dbc1187410a6c23ab97c  stellarium-0.20.3.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 543e6fa23d..d9ba29c8b5 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.20.2
+STELLARIUM_VERSION = 0.20.3
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
-- 
2.27.0
