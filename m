From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 14:32:35 +0200
Subject: [Buildroot] [git commit] gd: switch to new homepage
Message-ID: <20140712123246.A3C7D9C693@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89d26851ca8ab9e47d6768ae69b1877de0d69766
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gd/Config.in b/package/gd/Config.in
index ba6f326..e838635 100644
--- a/package/gd/Config.in
+++ b/package/gd/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GD
 	  useful in World Wide Web applications, where PNG is one of
 	  the formats accepted for inline images by most browsers.
 
-	  http://www.boutell.com/gd/
+	  http://libgd.bitbucket.org/
 
 if BR2_PACKAGE_GD
 
