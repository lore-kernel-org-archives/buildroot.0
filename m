From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 12:52:28 -0300
Subject: [Buildroot] [PATCH v2 5/8] Config.in: remove
	BR2_DEPRECATED_SINCE_2014_02
In-Reply-To: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425397951-30603-5-git-send-email-gustavo@zacarias.com.ar>
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
index 0598042..2b39d6a 100644
--- a/Config.in
+++ b/Config.in
@@ -296,10 +296,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2014_02
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2014_05
 	bool
 	default y
-- 
2.0.5
