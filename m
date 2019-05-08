From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 23:33:47 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/runc: bump to
 version 1.0.0-rc8
Message-ID: <20190508214035.618E5813E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dcb05d25b5e74232fcc6eb0c3bddc183cd94f4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 045df6a4804087bf34d776839f42730e16d3f590)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 24c30f5726..969bb0bfb3 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	e8388b812d93a8a131a2a2fdd851847295c8e341721002940dadd2999fb81b51  runc-v1.0.0-rc7.tar.gz
+sha256	efe4ff9bbe49b19074346d65c914d809c0a3e90d062ea9619fe240f931f0b700  runc-v1.0.0-rc8.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 56463b468e..55097e5a17 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc7
+RUNC_VERSION = v1.0.0-rc8
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
