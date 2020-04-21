From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:37:58 +0200
Subject: [Buildroot] [git commit] package/openresolv: bump to 3.10.0
Message-ID: <20200421193603.D07E58FA92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae0cde388ad00afe0da1a5e3969bf4190f56860a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file change was a date update to 2020
https://github.com/rsmarples/openresolv/commit/e114fa2672a86a3b827599d4c4c5ec2ead0a94c2#diff-9879d6db96fd29134fc802214163b95a

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openresolv/openresolv.hash | 4 ++--
 package/openresolv/openresolv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
index b8eb4346b8..f2a101df39 100644
--- a/package/openresolv/openresolv.hash
+++ b/package/openresolv/openresolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0024df7c4568a157db1c3511a55d37d442629d586c575d9e0f9c2004df8297bd openresolv-3.9.2.tar.gz
-sha256 f78b2c2bfb333e66e935c81510580d002b6e2009a5b8132b3b5be8ed8f8f3fa7 LICENSE
+sha256  7d74c669849183ecefdfcec30d25664b1ca24ba1ca8c2ad5de50fcaeef3b4810  openresolv-3.10.0.tar.gz
+sha256  384740bf5e19e7628d20f4dcc22925062fdc6020e9a6f074e567d4d797be57a0  LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 3a64446698..44e0720428 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRESOLV_VERSION = 3.9.2
+OPENRESOLV_VERSION = 3.10.0
 OPENRESOLV_SITE = $(call github,rsmarples,openresolv,openresolv-$(OPENRESOLV_VERSION))
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
