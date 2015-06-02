From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 14:34:34 -0300
Subject: [Buildroot] [PATCH 1/2] Config.in: Add BR2_DEPRECATED_SINCE_2015_08
Message-ID: <1433266475-8782-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the deprecation of certain features in 2015.08, add
the BR2_DEPRECATED_SINCE_2015_08 symbol.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 2b39d6a..bdff7df 100644
--- a/Config.in
+++ b/Config.in
@@ -312,6 +312,10 @@ config BR2_DEPRECATED_SINCE_2015_05
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_08
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.3.6
