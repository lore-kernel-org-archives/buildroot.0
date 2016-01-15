From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jan 2016 18:55:54 +0100
Subject: [Buildroot] [git commit] Config.in: Add BR2_DEPRECATED_SINCE_2016_02
Message-ID: <20160115204330.85AFF7FC40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07941f42777f83adeb5527cfb02b343458c39ede
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In prepration for new deprecated features/symbols.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index f6f9b85..63feef8 100644
--- a/Config.in
+++ b/Config.in
@@ -365,6 +365,10 @@ config BR2_DEPRECATED_SINCE_2015_11
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2016_02
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
