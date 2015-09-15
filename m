From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:48:22 +0200
Subject: [Buildroot] [git commit] lttng-libust: Bump version to 2.6.2
Message-ID: <20150915215730.CD0387FEBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e6ba875a31da766beeae62770cd5a8ade60942e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.hash |    4 ++--
 package/lttng-libust/lttng-libust.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 65db612..aafc2ba 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,2 +1,2 @@
-# http://www.lttng.org/files/lttng-ust/lttng-ust-2.6.0.tar.bz2.sha1
-sha1  774fc2052781ba6fd789d422223c739d5f64482d  lttng-ust-2.6.0.tar.bz2
+# http://www.lttng.org/files/lttng-ust/lttng-ust-2.6.2.tar.bz2.sha1
+sha1  bfa9cbdabd8698cf5b98667eac5c39775127f634  lttng-ust-2.6.2.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 2afcd61..4976ff4 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.6.0
+LTTNG_LIBUST_VERSION = 2.6.2
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
