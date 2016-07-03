From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:58:51 +0200
Subject: [Buildroot] [git commit] mcookie: remove SOURCE variable
Message-ID: <20160703111601.1D5DA8015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0cc8792937558c52888c91f8d108e471b863de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the mcookie package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/mcookie/mcookie.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index 87a236f..b14599d 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-# Source included in Buildroot
-MCOOKIE_SOURCE =
 MCOOKIE_LICENSE = Public Domain
 
 define MCOOKIE_EXTRACT_CMDS
