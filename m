From: Lothar Felten <lothar.felten@gmail.com>
Date: Wed, 13 Jul 2016 22:13:39 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/Config: ti-sgx-km, ti-sgx-um,
	ti-sgx-demos
In-Reply-To: <1468440819-13434-1-git-send-email-lothar.felten@gmail.com>
References: <1468440819-13434-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468440819-13434-5-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the ti-sgx-km, ti-sgx-um and ti-sgx-demos packages to the Target Packages
/ Hardware handling menu.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1910251..e24aac1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,9 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-sgx-demos/Config.in"
+	source "package/ti-sgx-km/Config.in"
+	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
-- 
1.9.1
