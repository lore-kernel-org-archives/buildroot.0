From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Jun 2013 08:58:06 -0300
Subject: [Buildroot] [PATCH] bwm-ng: move to appropiate category
Message-ID: <1370347086-21126-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bwm-ng is a networking application, not a system one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index ce3943a..41bc936 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ source "package/boa/Config.in"
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/chrony/Config.in"
 source "package/connman/Config.in"
@@ -857,7 +858,6 @@ source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
-source "package/bwm-ng/Config.in"
 source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
-- 
1.8.1.5
