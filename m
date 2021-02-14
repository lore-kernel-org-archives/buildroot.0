From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:51:33 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/subversion: bump
 to version 1.13.0
Message-ID: <20210214163455.6D8EB825CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48056e1ff345cf5517b2aab69128603ef88648ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Update site to get latest release
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 85aeb5b3506e32426e75e385ce835b02c0a65be3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 6 +++---
 package/subversion/subversion.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 581834f98d..f78990cbb3 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.12.2.tar.bz2.sha512
-sha512 b1f859b460afa54598778d8633f648acb4fa46138f7d6f0c1451e3c6a1de71df859233cd9ac7f19f0f20d7237ed3988f0a38da7552ffa58391e19d957bc7c136 subversion-1.12.2.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.13.0.tar.bz2.sha512
+sha512  36f390b412bf772bf894efc2aadc247f12ca30ac407e04f664c14411c3519e1bb242d1239f2f44cbcb86eafc7c413efc8eadbfe1d1e75118235a7b7adc6c85b2  subversion-1.13.0.tar.bz2
 
 # Locally calculated
-sha256 484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad LICENSE
+sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 2044a6420f..010329357c 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.12.2
+SUBVERSION_VERSION = 1.13.0
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
-SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
+SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
 SUBVERSION_DEPENDENCIES = \
