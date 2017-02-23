From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:08:39 +0100
Subject: [Buildroot] [git commit] trousers: update ARC comment
Message-ID: <20170223210927.314C882244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8b2bd81a1a5401c10287f2d5c6c8b4a14994764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the comment about the ARC exception to match the one used in VLC,
so that a 'git grep "ARC toolchain issue"' returns the list of packages
to re-evaluate on ARC when the ARC toolchain gets upgraded.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trousers/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index 11ab874..de3b951 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_TROUSERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# doesn't build properly in static only configurations
 	depends on !BR2_STATIC_LIBS
-	# broken toolchain
+	# ARC toolchain issue
 	depends on !BR2_arc
 	help
 	  The open-source TCG Software Stack (TSS).
