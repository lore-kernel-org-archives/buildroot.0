From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 16 Jun 2016 16:41:14 +0200
Subject: [Buildroot] [PATCH 2/3] Config.in: Add BR2_DEPRECATED_SINCE_2016_08
In-Reply-To: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
References: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1466088075-7635-3-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for new deprecated features/symbols.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 9fa74157a4be..820b1f0945db 100644
--- a/Config.in
+++ b/Config.in
@@ -385,6 +385,10 @@ config BR2_DEPRECATED_SINCE_2016_05
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2016_08
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.1.0
