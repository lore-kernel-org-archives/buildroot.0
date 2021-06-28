From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 28 Jun 2021 16:08:16 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/fb-test-app: Move 'rosetta'
 prefix from VERSION to SITE
Message-ID: <20210628130816.29769-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move 'rosetta' prefix from VERSION to SITE to have version be
in a standard format.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/fb-test-app/fb-test-app.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index f6e949015ef8..89d533ab15b4 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FB_TEST_APP_VERSION = rosetta-1.1.1
-FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,$(FB_TEST_APP_VERSION))
+FB_TEST_APP_VERSION = 1.1.1
+FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,rosetta-$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPL-2.0
 FB_TEST_APP_LICENSE_FILES = COPYING
 
-- 
2.30.2
