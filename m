From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 Sep 2016 22:17:26 -0300
Subject: [Buildroot] [PATCH 3/4] Config.in: Add BR2_DEPRECATED_SINCE_2016_11
In-Reply-To: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1473297447-8804-3-git-send-email-gustavo@zacarias.com.ar>
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
index d9b1df8..e1c16c0 100644
--- a/Config.in
+++ b/Config.in
@@ -393,6 +393,10 @@ config BR2_DEPRECATED_SINCE_2016_08
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2016_11
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.7.3
