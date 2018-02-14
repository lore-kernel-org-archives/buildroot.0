From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:05:16 +0100
Subject: [Buildroot] [git commit branch/next] keepalived: bump to version
 1.4.1
Message-ID: <20180214210531.E159385027@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6320325eba253935f53e75e8ed365ad704d2b443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add license file hash.

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.hash | 3 ++-
 package/keepalived/keepalived.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 5d33c5be00..4590c33ef9 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	c0114d86ea4c896557beb0d9367819a423ffba772bc5d7c548dc455e6b3bd048  keepalived-1.3.5.tar.gz
+sha256	220407517ccad822d1ffa80f7bc37582abaf97da6f7bda2326fa6904b1855bd0  keepalived-1.4.1.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 59d3cb5cfb..6d3d8e7cc6 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 1.3.5
+KEEPALIVED_VERSION = 1.4.1
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
 KEEPALIVED_LICENSE = GPL-2.0+
