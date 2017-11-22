From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:29:32 +0100
Subject: [Buildroot] [git commit branch/next] libxml2: bump to 2.9.7
Message-ID: <20171122212320.6A4FA805AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a54794e6525444f1031d468e2d16889df334b626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 217a51f..f7e046b 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	4031c1ecee9ce7ba4f313e91ef6284164885cdb69937a123f6a83bb6a72dcd38	libxml2-2.9.5.tar.gz
+sha256	f63c5e7d30362ed28b38bfa1ac6313f9a80230720b7fb6c80575eeab3ff5900c	libxml2-2.9.7.tar.gz
 # License files, locally calculated
 sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 1b870c4..a6285a6 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.5
+LIBXML2_VERSION = 2.9.7
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
