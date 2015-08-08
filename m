From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:29 -0000
Subject: [Buildroot] [git commit branch/next] package/matchbox: make it a
	menu
Message-ID: <20150808105607.53C9F7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2a7ad665d90ad76ff64c064c27bcb1d7d368d22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We're about to add a few more options, so it now warrants a menu for
itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index d850a39..ae33ecf 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_MATCHBOX
+menuconfig BR2_PACKAGE_MATCHBOX
 	bool "matchbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
