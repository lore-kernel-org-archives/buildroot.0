From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Jun 2021 18:43:45 +0200
Subject: [Buildroot] [git commit] package/fb-test-app: bump version to 1.3.1
 and update project URL
Message-ID: <20210613161831.194228B2F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72fdd27b87942ac7f99730afe02b58638d105677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 1.1.1
- update project URL

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fb-test-app/fb-test-app.hash | 2 +-
 package/fb-test-app/fb-test-app.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fb-test-app/fb-test-app.hash b/package/fb-test-app/fb-test-app.hash
index 06611db799..3068caf278 100644
--- a/package/fb-test-app/fb-test-app.hash
+++ b/package/fb-test-app/fb-test-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6baf6b45968d0bb9a5527c6c4bf18661e9f9eb9be973a6d1952c38168c90d58f  fb-test-app-rosetta-1.1.0.tar.gz
+sha256  45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db  fb-test-app-rosetta-1.1.1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 1ab7b2f219..1be59a4207 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FB_TEST_APP_VERSION = rosetta-1.1.0
-FB_TEST_APP_SITE = $(call github,prpplague,fb-test-app,$(FB_TEST_APP_VERSION))
+FB_TEST_APP_VERSION = rosetta-1.1.1
+FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPL-2.0
 FB_TEST_APP_LICENSE_FILES = COPYING
 
