From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:13:48 +0200
Subject: [Buildroot] [git commit] botan: bump to version 2.8.0
Message-ID: <20181010071240.5F8D481E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81496de675b2b70278a252f86b9071e8e019154e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build on i586, https://patchwork.ozlabs.org/patch/970313 has been
merged upstream

Fixes:
 - http://autobuild.buildroot.org/results/aaa2ea8c3fb5fe954c0af0061f83ad70e0a862f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index eeb94145b9..faa467ec25 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256 e42df91556317588c6ca0e41bf796f9bd5ec5c70e0668e6c97c608c697c24a90  Botan-2.7.0.tgz
+sha256 e7159b127e91e0c158245d61c638c50d443ec7b440b6b0161328c47b3aba3960  Botan-2.8.0.tgz
 # Locally computed
 sha256 40cfd35a9e34d18463806f57553c968fdbaf254a2e2a636d1d8e32ff6b698495  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 59aa1f0803..3de54aa3e1 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.7.0
+BOTAN_VERSION = 2.8.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
