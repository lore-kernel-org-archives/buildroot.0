From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:37:54 +0100
Subject: [Buildroot] [git commit] bonnie: Expand description in config help
	text.
Message-ID: <20160201224700.1459E7FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=996b4d99626f1ebc5ebcc46ce7b3320a1997d58e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The description "Filesystem tester" is rather unhelpful. Take the
description from the referenced web site to make it a bit clearer what
bonnie++ actually is.

[Thomas: rewrap Config.in help text.]

Signed-off-by: Cam Hutchison <camh@xdna.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bonnie/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 6dbd06d..4b0adda 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_BONNIE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	help
-	  Filesystem tester
+	  A benchmark suite that is aimed at performing a number of
+	  simple tests of hard drive and file system performance.
 
 	  http://www.coker.com.au/bonnie++/
 
