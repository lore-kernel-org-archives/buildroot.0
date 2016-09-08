From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 20:29:16 +0200
Subject: [Buildroot] [git commit] Config.in: Add BR2_DEPRECATED_SINCE_2016_11
Message-ID: <20160908183012.991487FC73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac1f324a1a90b1d7afdf139162f561b0f3835c46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for new deprecated features/symbols.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 3f53f25..fdc1ad0 100644
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
