From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:57:51 +0200
Subject: [Buildroot] [git commit] mkpimage: remove SOURCE
Message-ID: <20160703111600.D13A27F8CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d21aaa9baf545a4630df0a3b7f384595c8e18835
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the mkpimage package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mkpimage/mkpimage.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
index 6360902..c30a680 100644
--- a/package/mkpimage/mkpimage.mk
+++ b/package/mkpimage/mkpimage.mk
@@ -7,7 +7,6 @@
 # source included in the package
 # came from barebox's repository:
 # http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD
-HOST_MKPIMAGE_SOURCE =
 HOST_MKPIMAGE_LICENSE = GPLv2
 
 define HOST_MKPIMAGE_BUILD_CMDS
