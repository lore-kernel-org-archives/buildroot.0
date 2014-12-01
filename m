From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Dec 2014 11:17:00 -0300
Subject: [Buildroot] [PATCH 5/5] Remove BR2_DEPRECATED_SINCE_2013_11
In-Reply-To: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1417443420-31985-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symbol is unused so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Config.in b/Config.in
index e2d3dfd..1aa1080 100644
--- a/Config.in
+++ b/Config.in
@@ -298,10 +298,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2013_11
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2014_02
 	bool
 	default y
-- 
2.0.4
