From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 May 2014 08:29:18 +0200
Subject: [Buildroot] [git commit] config: kernel.org is now https-only
Message-ID: <20140524063448.BE2399C987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba14dbe2d5148a30b542457a682597da75e45571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Every requests on kernel.org gets redirected to https.
So just set our kernel.org settings straight to begin with.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index d402c93..0799cb7 100644
--- a/Config.in
+++ b/Config.in
@@ -186,7 +186,7 @@ config BR2_BACKUP_SITE
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
-	default "http://www.kernel.org/pub"
+	default "https://www.kernel.org/pub"
 	help
 	  kernel.org is mirrored on a number of servers around the world.
 	  The following allows you to select your preferred mirror.
