From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 07:49:24 -0300
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
	not development
Message-ID: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e2ca8ee..a65ceac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -86,9 +86,6 @@ source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
 source "package/bustle/Config.in"
 source "package/ccache/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/coreutils/Config.in"
-endif
 source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/diffutils/Config.in"
@@ -959,6 +956,7 @@ source "package/acl/Config.in"
 source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
+source "package/coreutils/Config.in"
 endif
 source "package/cpuload/Config.in"
 source "package/dsp-tools/Config.in"
-- 
1.8.3.2
