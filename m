From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] axfsutils: add explicit dependencies for
	host variant
Message-ID: <20160703064348.3EE358177C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81cb325c9d60a985ff0f9f116bec8d40a2698e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axfsutils/axfsutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index 6c9c58b..1bd6280 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -8,7 +8,7 @@ AXFSUTILS_VERSION = 64886703fdff6cfc64eb20fbe7d7295bbeec867b
 AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
 AXFSUTILS_LICENSE = GPLv2
 AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
-AXFSUTILS_DEPENDENCIES = host-zlib
+HOST_AXFSUTILS_DEPENDENCIES = host-zlib
 
 # The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
 # prerequisite. The 'legacy' one works just as well without that requirement.
