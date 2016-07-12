From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:28 +0200
Subject: [Buildroot] [PATCH 7/7] add ti-sgx package to menu
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-8-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the ti-sgx package to the Target Packages / Hardware handling menu

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 7d6924c..c412c6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-sgx/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
-- 
1.9.1
