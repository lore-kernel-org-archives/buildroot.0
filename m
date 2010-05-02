From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] libtool: added LIBTOOLIZE variable
	to point on $(HOST_DIR)/usr/bin/libtoolize
Message-ID: <20100502074444.593078A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21a74f14628d08141603ec8e6ba0756fedee7eca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtool/libtool.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index bbabbb0..4278029 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -25,3 +25,4 @@ $(eval $(call AUTOTARGETS,package,libtool,host))
 
 # variables used by other packages
 LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
+LIBTOOLIZE:=$(HOST_DIR)/usr/bin/libtoolize
-- 
1.6.3.3
