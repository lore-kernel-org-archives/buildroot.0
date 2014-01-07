From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2014 21:33:34 +0100
Subject: [Buildroot] [git commit] udev: mention dependancy on inotify
Message-ID: <20140107203417.C734D9BEF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b8d3147c7108a448f3c5960d72b48cfe94401d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: wrap help text]
Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udev/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 91dc7cf..7aa79c4 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -11,7 +11,8 @@ config BR2_PACKAGE_UDEV
 	help
 	  Userspace device daemon.
 
-	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
+	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
+	  and inotify.
 
 	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
