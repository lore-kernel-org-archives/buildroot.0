From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Feb 2019 12:01:01 +0100
Subject: [Buildroot] [git commit] package/intel-gmmlib: fix license file and
 add hash
Message-ID: <20190208105934.26FCE87F62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4a0cf21335ebdd38f99966a765ed2a600028da1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file is not named COPYING, but LICENSE.md. While we're at
it, we add the hash of the license file.

Fixes:

  http://autobuild.buildroot.net/results/09e4c14effe58ec2bc6f3deede7cc17ae6590767/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-gmmlib/intel-gmmlib.hash | 1 +
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 3c234ea307..d54abd2a43 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 7970a8ae4e16efb98f38fbbc0346eea03227fc4462a9bd8e8077277cc3430a84  intel-gmmlib-18.4.1.tar.gz
+sha256 b61d639c5d84ec710ffcf5600ac92f8a4ace66670c1f9bd921f3bde671d36033  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 6af3152937..4d89086590 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -7,7 +7,7 @@
 INTEL_GMMLIB_VERSION = 18.4.1
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
-INTEL_GMMLIB_LICENSE_FILES = COPYING
+INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
 
 INTEL_GMMLIB_INSTALL_STAGING = YES
 INTEL_GMMLIB_SUPPORTS_IN_SOURCE_BUILD = NO
