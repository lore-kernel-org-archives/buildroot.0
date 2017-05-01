From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 09:20:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain-external:
	CodeSourcery aarch64 update upstream URL
Message-ID: <20170501072636.E6D3A82836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc84f9612d9ccfa3bf8c03ec8299ae45887be94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The current URL returns error 403: Forbidden, so switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3e069f41bfd62cbb034ccd7f531b976564bda121)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-codesourcery-aarch64.mk                          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
index bc58c44..e320d3d 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION = 2014.11-95
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SOURCE = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_ACTUAL_SOURCE_TARBALL = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
