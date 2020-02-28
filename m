From: Nayna Jain <nayna@linux.ibm.com>
Date: Fri, 28 Feb 2020 14:05:53 -0500
Subject: [Buildroot] [PATCH] package/kexec-lite: Bump the version
Message-ID: <1582916753-1681-1-git-send-email-nayna@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changes include:

kexec: improve kexec_file_load error message

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
The patch is based on "next" branch.

 package/kexec-lite/kexec-lite.hash | 2 +-
 package/kexec-lite/kexec-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
index 0100823..e2426a4 100644
--- a/package/kexec-lite/kexec-lite.hash
+++ b/package/kexec-lite/kexec-lite.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6eb115c8db3a071b970d7ba985ea5e2425e1e716952186f9a4fe329a2e2bb1ca  kexec-lite-18ec88310c4134eca2f9e3c417cd09f5914bf633.tar.gz
+sha256  1027c69721e8ee21614273a540e1dd505370d8d814845c0adaf838496105a35d  kexec-lite-6b0130b3c1ea489e061cda2805e6f8b68dc96a76.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index e44c6df..a3e99f4 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_LITE_VERSION = 18ec88310c4134eca2f9e3c417cd09f5914bf633
+KEXEC_LITE_VERSION = 6b0130b3c1ea489e061cda2805e6f8b68dc96a76 
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPL-2.0+
 KEXEC_LITE_LICENSE_FILES = COPYING
-- 
1.8.3.1
