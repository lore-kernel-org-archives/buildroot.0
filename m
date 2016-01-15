From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Jan 2016 07:47:46 -0300
Subject: [Buildroot] [PATCH] Config.in: Add BR2_DEPRECATED_SINCE_2016_02
Message-ID: <1452854866-25826-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In prepration for new deprecated features/symbols.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index f6f9b85..63feef8 100644
--- a/Config.in
+++ b/Config.in
@@ -365,6 +365,10 @@ config BR2_DEPRECATED_SINCE_2015_11
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2016_02
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.4.10
