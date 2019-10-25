From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 18:28:20 +0200
Subject: [Buildroot] [git commit] package/intel-mediasdk: bump version to
 19.2.1
Message-ID: <20191025162540.5C36F870E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=855926e5bb65c14c502ee9a5dea54a4ad27bd304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediasdk/intel-mediasdk.hash | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 2d2e36384f..2a582e6116 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 259d9b57df4fca316898b6dbe7b4d561ce42160fa953f36e2a4b357e86116bf9  intel-mediasdk-18.4.0.tar.gz
+sha256 03c11a0379b61e292e789fa3dc9308ce45f36d68b4ebf437806c0e2c32357970  intel-mediasdk-19.2.1.tar.gz
 sha256 dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index c47e99117f..368e108308 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 18.4.0
+INTEL_MEDIASDK_VERSION = 19.2.1
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
