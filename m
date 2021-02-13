From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 23:27:53 +0100
Subject: [Buildroot] [git commit branch/next] package/uhttpd: bump version
 to f53a639
Message-ID: <20210213221553.E476681358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2854c31aceac89f8b397fd456229802e3837d3e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- change download url to https

- update license file hash (uhttpd.h - license unrelated source
  code changes only)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uhttpd/uhttpd.hash | 4 ++--
 package/uhttpd/uhttpd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 389a0ef636..6f8b4a60f8 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5b81ebf9e419c668de4181cce7b9f5fa358cabb2a4a0d1f1a3a24190eeb21f25  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82-br1.tar.gz
-sha256  2a61a8a690e7646a4bfe4261bf77c49f47588db5fc234b3cc66809dcc0cb3985  uhttpd.h
+sha256  8a537a377c8dc1abda147a1e3feb3fe3e3633a9d30e4e37d378cc6309dace2f0  uhttpd-f53a63999784bcb7dc513e221f3f25dd3de2f35e-br1.tar.gz
+sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index cc7649d0ec..355a266d6b 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = a8bf9c00842224edb394e79909053f7628ee6a82
-UHTTPD_SITE = http://git.openwrt.org/project/uhttpd.git
+UHTTPD_VERSION = f53a63999784bcb7dc513e221f3f25dd3de2f35e
+UHTTPD_SITE = https://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
 UHTTPD_LICENSE_FILES = uhttpd.h
