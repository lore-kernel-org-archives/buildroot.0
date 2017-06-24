From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:09:58 +0200
Subject: [Buildroot] [git commit] psmisc: update homepage link
Message-ID: <20170624100911.2B15480579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=568cc42f688957d8517ccd85812f2c841cc5101f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gitlab repo is much more informative and updated.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/psmisc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index 734542c..2b66bcf 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PSMISC
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
-	  http://psmisc.sourceforge.net/
+	  https://gitlab.com/psmisc/psmisc
