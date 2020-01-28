From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 23:23:53 +0100
Subject: [Buildroot] [git commit] package/opkg: bump version to 0.4.2
Message-ID: <20200128221533.318648404C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3880544582c676e74a010ce816f18b7246ff38b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Max Berger <phobie@protonmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg/opkg.hash | 2 +-
 package/opkg/opkg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index 69eebde2d3..b1ead67a11 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256 45ac1e037d3877f635d883f8a555e172883a25d3eeb7986c75890fdd31250a43  opkg-0.4.1.tar.gz
+sha256 86887852c43457edfff9d8b6d9520f3f1cdd55f25eb600a6eb31e1c4e151e106  opkg-0.4.2.tar.gz
 # Locally calculated
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 8155ed381f..e25e51b9e6 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.4.1
+OPKG_VERSION = 0.4.2
 OPKG_SITE = http://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
