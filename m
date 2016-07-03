From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:58:27 +0200
Subject: [Buildroot] [git commit] tz: remove SOURCE variable
Message-ID: <20160703111601.07B9B7F8CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b1808d3e3c5d3dd7146265f620997010aa3979e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the tz package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tz/tz.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 7a756eb..f0daf46 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-TZ_SOURCE =
 TZ_DEPENDENCIES = host-tzdata host-tzdump
 TZ_LICENSE = Public domain
 
