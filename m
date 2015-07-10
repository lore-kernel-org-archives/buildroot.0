From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:57:10 +0200
Subject: [Buildroot] [git commit] bootutils: update website URL
Message-ID: <20150710225713.70272819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55dd510bcb2b2c552e72536de7b02745a6fbee81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original homepage seems to be down. Use the sourceforge intro page
instead.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bootutils/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index 308db24..370da0d 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_BOOTUTILS
 	  either by label or explicit label= on the kernel command line,
 	  mounting it, and 'switchroot'ing is automated.
 
-	  http://bootutils.pr.linuxrulz.org/
+	  http://bootutils.sourceforge.net/
