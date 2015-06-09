From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:06:13 +0200
Subject: [Buildroot] [git commit] package/matchbox: make it a menu
Message-ID: <20150609211052.AA66A81DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2a7ad665d90ad76ff64c064c27bcb1d7d368d22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
