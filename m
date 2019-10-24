From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Thu, 24 Oct 2019 09:58:21 +0200
Subject: [Buildroot] [PATCH 3/3] package/intel-mediasdk: bump version to
 19.2.1
In-Reply-To: <20191024075821.31155-1-lpdev@cordier.org>
References: <20191024075821.31155-1-lpdev@cordier.org>
Message-ID: <20191024075821.31155-3-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
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
-- 
2.20.1
