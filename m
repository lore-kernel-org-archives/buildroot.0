From: Jens Scheidemann <nobodyman@gmx.de>
Date: Sat, 10 Mar 2018 21:39:52 +0100
Subject: [Buildroot] [PATCH 3/5] New package golang-embed, golang-gb
In-Reply-To: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
References: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
Message-ID: <1520714394-2918-3-git-send-email-nobodyman@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed for example to compile gosdm630.

Signed-off-by: Jens Scheidemann <nobodyman@gmx.de>
---
 package/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9..8544909 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -22,6 +22,8 @@ menu "Host utilities"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
+	source "package/golang-embed/Config.in.host"
+	source "package/golang-gb/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
-- 
2.7.4
