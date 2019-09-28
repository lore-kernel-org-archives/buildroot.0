From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:23:03 +0200
Subject: [Buildroot] [git commit] package/lttng-tools: bump to version 2.10.7
Message-ID: <20190928191853.6EC1D8F822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de714f03314a3a94822b5f745ef80223b651ffbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-tools/lttng-tools.hash | 6 ++----
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index f6c01b7dec..5db2e71501 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,8 +1,6 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.5.tar.bz2.{md5,sha1}
-md5 50e07676d5eb5d6cf4ece804863a6f74  lttng-tools-2.10.5.tar.bz2
-sha1 68790d44529a3b29896c35bb2350e8a0e1226264  lttng-tools-2.10.5.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.7.tar.bz2.sha256
+sha256 ed71ebe00c5d985c74f30e97b614e909573cbd9276c85e05d9557a0b817a1312  lttng-tools-2.10.7.tar.bz2
 # Locally computed
-sha256 a4868078ef961e83dc236c4f24fd848161bfa755344b064dece62c4c81a07411  lttng-tools-2.10.5.tar.bz2
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
 sha256 051be1f11b508ef7bb839994f6b58be19a827c56bd9bddfe36d77d3d4be55abe  lgpl-2.1.txt
 sha256 f07515677547da5f3ee2396bdf491affc1accd5e4765a5378b6e1e98392fd5e7  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index ce07ce4b52..295eb3c9fb 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.10.5
+LTTNG_TOOLS_VERSION = 2.10.7
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
