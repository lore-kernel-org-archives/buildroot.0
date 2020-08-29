From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 19:36:41 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/gsl: bump to version 2.6
Message-ID: <20200829173641.2463266-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

http://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS?h=release-2-6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gsl/gsl.hash | 4 ++--
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index 8a979d6e8b..0d40a75497 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 0460ad7c2542caaddc6729762952d345374784100223995eb14d614861f2258d  gsl-2.5.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  b782339fc7a38fe17689cb39966c4d821236c28018b6593ddb6fd59ee40786a8  gsl-2.6.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index d3c764787d..416955b72c 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 2.5
+GSL_VERSION = 2.6
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
-- 
2.28.0
