From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 17:17:53 +0200
Subject: [Buildroot] [git commit] uredir: remove default value of _SOURCE
 variable
Message-ID: <20200902161639.DDD9685EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37ce30631d50075bedb11bd9d7047617c9200549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uredir/uredir.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uredir/uredir.mk b/package/uredir/uredir.mk
index 6ca394730e..22ffaa742d 100644
--- a/package/uredir/uredir.mk
+++ b/package/uredir/uredir.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 UREDIR_VERSION = 3.3
-UREDIR_SOURCE = uredir-$(UREDIR_VERSION).tar.gz
 UREDIR_SITE = https://github.com/troglobit/uredir/releases/download/v$(UREDIR_VERSION)
 UREDIR_LICENSE = ISC
 UREDIR_LICENSE_FILES = LICENSE
