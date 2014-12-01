From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Dec 2014 11:16:56 -0300
Subject: [Buildroot] [PATCH 1/5] Add BR2_DEPRECATED_SINCE_2015_02
Message-ID: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the deprecation of certain features in 2015.02, add
the BR2_DEPRECATED_SINCE_2015_02 symbol.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 8d7081f..e2d3dfd 100644
--- a/Config.in
+++ b/Config.in
@@ -314,6 +314,10 @@ config BR2_DEPRECATED_SINCE_2014_08
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_02
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.0.4
