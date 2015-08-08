From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:04 -0000
Subject: [Buildroot] [git commit branch/next] Config.in: Add
	BR2_DEPRECATED_SINCE_2015_08
Message-ID: <20150808105603.B09B37FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=602692a225d48f01c3c50eb3a09f8b4c0a81c6bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the deprecation of certain features in 2015.08, add
the BR2_DEPRECATED_SINCE_2015_08 symbol.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
