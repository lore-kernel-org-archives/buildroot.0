From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2021 17:53:16 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wavpack: bump to
 version 5.3.0
Message-ID: <20210117163646.4234188381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb5f9b67da2a3af11e08eaed0a140b7f41c212a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Update hash of COPYING (update in year):
https://github.com/dbry/WavPack/commit/350b6d7737383029573ea2cce9bd94f1b6756bbd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c355c8f7e9b4fdb1905063141393825e44b54c84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavpack/wavpack.hash | 4 ++--
 package/wavpack/wavpack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 6b1f90a1fe..eeef730321 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  77e5b1cfa26e387e4275b362f0c3fb9a27106447d9bce00f9f794f30badb77e3  wavpack-5.2.0.tar.xz
-sha256  2ab58075e26305cc16920e9867c1d43f46ce81adab2051100dd316a3a93a2619  COPYING
+sha256  b444379a0bee0330f137cb3e9a100e6a12a63a6d01987ba66b3729f85e282307  wavpack-5.3.0.tar.xz
+sha256  a0bbe245dfe263f73946b72306e8336818009ff1e52b119784c288f2785fc260  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 8cb7754b2b..6403f93ac9 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.2.0
+WAVPACK_VERSION = 5.3.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
