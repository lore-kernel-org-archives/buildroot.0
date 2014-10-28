From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:13:02 +0100
Subject: [Buildroot] [git commit] lttng-libust: bump version
Message-ID: <20141028212859.DBDB8B1DD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62e79e97501bc5950fff33179391536c55f9e00e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.hash |    6 ++++++
 package/lttng-libust/lttng-libust.mk   |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
new file mode 100644
index 0000000..ac897f3
--- /dev/null
+++ b/package/lttng-libust/lttng-libust.hash
@@ -0,0 +1,6 @@
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.6.0-rc1.tar.bz2.sha1
+sha1    8db1627f16f466589c7842822ea4ad2f9d406b02  lttng-ust-2.5.1.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.6.0-rc1.tar.bz2.md5
+md5     d551d601bdc1a9285e1cd6c5728fb803  lttng-ust-2.5.1.tar.bz2
+# Locally generated
+sha256  fbd9e2d78641e5c659f1d51f8097c8279c155ff50f8e38a4c57f188ca4b84546  lttng-ust-2.5.1.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index a84cbc6..e6f02ca 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.5.0
+LTTNG_LIBUST_VERSION = 2.5.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
