From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 12:52:24 -0300
Subject: [Buildroot] [PATCH v2 1/8] Config.in: Add
	BR2_DEPRECATED_SINCE_2015_05
Message-ID: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the deprecation of certain features in 2015.05, add
the BR2_DEPRECATED_SINCE_2015_05 symbol.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index ce239d6..0598042 100644
--- a/Config.in
+++ b/Config.in
@@ -312,6 +312,10 @@ config BR2_DEPRECATED_SINCE_2015_02
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_05
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.0.5
