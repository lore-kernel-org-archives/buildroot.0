From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 15:54:18 +0100
Subject: [Buildroot] [git commit] genimage: Fix typo in description
Message-ID: <20170228145641.9575D82240@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6395652c0a7101bfe5c1ca65d2c8a740fd45ba64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
index acf777c..5c5a8a8 100644
--- a/package/genimage/Config.in.host
+++ b/package/genimage/Config.in.host
@@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GENIMAGE
 	  images from a given root filesystem tree. genimage is
 	  intended to be run in a fakeroot environment.
 
-	  Configuration is done is a config file parsed by
+	  Configuration is done in a config file parsed by
 	  libconfuse. Options like the path to tools can be given in
 	  environment variables, the config file or commandline
 	  switches.
