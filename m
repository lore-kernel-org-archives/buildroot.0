From: Jens Scheidemann <nobodyman@gmx.de>
Date: Sat, 10 Mar 2018 21:39:54 +0100
Subject: [Buildroot] [PATCH 5/5] New package gosdm630
In-Reply-To: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
References: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
Message-ID: <1520714394-2918-5-git-send-email-nobodyman@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is useful to read data from energy meter SDM630.

Signed-off-by: Jens Scheidemann <nobodyman@gmx.de>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c..a03ccd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1226,6 +1226,7 @@ menu "Hardware handling"
 	source "package/tslib/Config.in"
 	source "package/urg/Config.in"
 	source "package/wiringpi/Config.in"
+	source "package/gosdm630/Config.in"
 endmenu
 
 menu "Javascript"
-- 
2.7.4
