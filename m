From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:37:16 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/util-linux: fix
 licence definition formatting
Message-ID: <20191030123054.B3CCC8E08B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6312fab59b3c397d7a15331efaffaf2d30ff581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
Reviewed-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 652b1aa113ec7d50e96e34dc6aa00661a71ceb70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 96b72625e9..b17c0e9b7c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -11,7 +11,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
+UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid), ISC (rfkill)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
