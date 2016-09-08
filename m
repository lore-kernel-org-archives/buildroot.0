From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Sep 2016 15:39:02 -0300
Subject: [Buildroot] [PATCH 6/6] Config.in: remove
	BR2_DEPRECATED_SINCE_2015_08
In-Reply-To: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1473359942-15810-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's now unused.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Config.in b/Config.in
index bea3323..e614c8f 100644
--- a/Config.in
+++ b/Config.in
@@ -369,10 +369,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2015_08
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2015_11
 	bool
 	default y
-- 
2.7.3
