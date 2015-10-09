From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:22:36 +0200
Subject: [Buildroot] [git commit] swupdate: fix description typo
Message-ID: <20151009132248.07B4681F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33cffee77d92b195d5f7978616bcc0468e1ea493
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 4625393..f475b85 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_SWUPDATE
 	    to the webserver.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
 	    partitions.
-	  * Select BR2_PACKAGE_ZLIB if you want to deal with zip compressed
+	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
 	    archives.
 
 	  https://sbabic.github.io/swupdate
