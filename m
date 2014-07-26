From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 08:56:37 +0200
Subject: [Buildroot] [git commit] package/eudev: Update project URL in
	Config.in
Message-ID: <20140726065738.B36049D2F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1a11a0ccc3089c1a33e2bc2fe8bfca6728d6174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Arnout:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/90060/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 40ff721..6101d6d 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_EUDEV
 	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
 	  and inotify.
 
-	  http://github.com/gentoo/eudev/
+	  http://dev.gentoo.org/~blueness/eudev
 
 if BR2_PACKAGE_EUDEV
 
