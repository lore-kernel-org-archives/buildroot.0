From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 14 Feb 2020 15:28:23 +0100
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 19.4.0r
In-Reply-To: <20200214142824.27553-1-lpdev@cordier.org>
References: <20200214142824.27553-1-lpdev@cordier.org>
Message-ID: <20200214142824.27553-2-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Louis-Paul CORDIER <lpdev@cordier.org>

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/intel-mediadriver/intel-mediadriver.hash | 3 ++-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index f53d19a69d..a3f124c3f8 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256 79279c991d918deaa52239dac55787b9c7562e520cd58744171b468d28b8af40  intel-media-19.2.1.tar.gz
+sha256 a03bd75eefe9cb0245e3aab2723b3fef555d9f180a180b2c29d7b12d483d9ec2  intel-media-19.4.0r.tar.gz
 sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
+
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 0acac52e35..c3157867ed 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 19.2.1
+INTEL_MEDIADRIVER_VERSION = 19.4.0r
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.20.1
