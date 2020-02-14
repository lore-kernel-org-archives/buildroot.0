From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 14 Feb 2020 15:28:24 +0100
Subject: [Buildroot] [PATCH 3/3] package/intel-mediasdk: bump version to
 19.4.0
In-Reply-To: <20200214142824.27553-1-lpdev@cordier.org>
References: <20200214142824.27553-1-lpdev@cordier.org>
Message-ID: <20200214142824.27553-3-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Louis-Paul CORDIER <lpdev@cordier.org>

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/intel-mediasdk/intel-mediasdk.hash | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 2a582e6116..103c8bb52d 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 03c11a0379b61e292e789fa3dc9308ce45f36d68b4ebf437806c0e2c32357970  intel-mediasdk-19.2.1.tar.gz
+sha256 289a40ffe73dc291461d97edf452bdc622f76e52666483fd1eb4f131d2921cd1  intel-mediasdk-19.4.0.tar.gz
 sha256 dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 368e108308..a2ffe081db 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 19.2.1
+INTEL_MEDIASDK_VERSION = 19.4.0
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.20.1
