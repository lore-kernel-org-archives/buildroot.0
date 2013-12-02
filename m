From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 07:49:27 -0300
Subject: [Buildroot] [PATCH 4/5] zsh: alpha sort menu option
In-Reply-To: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385981368-2235-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index a65ceac..e70a58c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -932,7 +932,6 @@ source "package/at/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bash/Config.in"
 source "package/dash/Config.in"
-source "package/zsh/Config.in"
 endif
 source "package/dialog/Config.in"
 source "package/dtach/Config.in"
@@ -949,6 +948,9 @@ source "package/time/Config.in"
 source "package/which/Config.in"
 endif
 source "package/xmlstarlet/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/zsh/Config.in"
+endif
 endmenu
 
 menu "System tools"
-- 
1.8.3.2
