From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 14:54:57 -0300
Subject: [Buildroot] [PATCH 1/2] Config.in: Add BR2_DEPRECATED_SINCE_2016_05
Message-ID: <1456163698-7860-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for new deprecated features/symbols.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 30e88e3..dfb5721 100644
--- a/Config.in
+++ b/Config.in
@@ -365,6 +365,10 @@ config BR2_DEPRECATED_SINCE_2016_02
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2016_05
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.4.10
