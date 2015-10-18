From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:41:08 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: remove empty line
Message-ID: <20151018214113.5BC9981D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01f41585a78406f6e830d5eaf4413a983812a299
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7d2d63f..a452bf5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -250,7 +250,6 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
 	  examples.
 
-
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 	bool "DirectFB example df_fire has been removed"
 	select BR2_LEGACY
