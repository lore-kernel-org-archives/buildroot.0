From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Thu, 24 Oct 2019 09:58:20 +0200
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 19.2.1
In-Reply-To: <20191024075821.31155-1-lpdev@cordier.org>
References: <20191024075821.31155-1-lpdev@cordier.org>
Message-ID: <20191024075821.31155-2-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 095f57603d..f53d19a69d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 57a5c0d4dc7e34d7940d23346bbdee2b6cdfbfa81d64f5b77506da8b4298df43  intel-media-18.4.0.tar.gz
+sha256 79279c991d918deaa52239dac55787b9c7562e520cd58744171b468d28b8af40  intel-media-19.2.1.tar.gz
 sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 96d40c6cac..0acac52e35 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 18.4.0
+INTEL_MEDIADRIVER_VERSION = 19.2.1
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
@@ -22,7 +22,6 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
 INTEL_MEDIADRIVER_CONF_OPTS = \
-	-DMEDIA_VERSION="2.0.0" \
 	-DBUILD_ALONG_WITH_CMRTLIB=1 \
 	-DINSTALL_DRIVERS_SYSCONF=OFF \
 	-DMEDIA_RUN_TEST_SUITE=OFF \
-- 
2.20.1
