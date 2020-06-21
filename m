From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jun 2020 10:20:17 +0200
Subject: [Buildroot] [PATCH] more about package managers
Message-ID: <20200621082017.182812-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 85d732636..a938b0d8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2253,6 +2253,7 @@ comment "http://buildroot.org/manual.html#faq-no-binary-packages"
 comment "-------------------------------------------------------"
 	source "package/opkg/Config.in"
 	source "package/rpm/Config.in"
+comment "BusyBox could supply its own version of dpkg and rpm."
 endmenu
 
 menu "Real-Time"
-- 
2.25.1
