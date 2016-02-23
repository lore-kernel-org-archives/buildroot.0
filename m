From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:56:26 +0100
Subject: [Buildroot] [git commit] Config.in: Add BR2_DEPRECATED_SINCE_2016_05
Message-ID: <20160302202756.AE5A67FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bca107ee6d010ec0f61526bd800a2beec9f82c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for new deprecated features/symbols.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
