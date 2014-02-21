From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2014 21:54:31 +0100
Subject: [Buildroot] [git commit] jansson: bump to 2.6
Message-ID: <20140228133415.97F919BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be7e2bca8dc96e0e2da50a2237ce406c9e8d079f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jansson/jansson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index bb3240f..6ead0ec 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.5
+JANSSON_VERSION = 2.6
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
