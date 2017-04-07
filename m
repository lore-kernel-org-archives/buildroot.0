From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Apr 2017 22:15:32 +0200
Subject: [Buildroot] [git commit] ethtool: update homepage link
Message-ID: <20170407202025.4F1AB8275D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08b42319e8692c545b44d2649047daefb7d151ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
index 48c6062..0970497 100644
--- a/package/ethtool/Config.in
+++ b/package/ethtool/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_ETHTOOL
 	  ethtool is a small utility for examining and tuning your
 	  ethernet-based network interface.
 
-	  http://sourceforge.net/projects/gkernel/
+	  https://www.kernel.org/pub/software/network/ethtool/
