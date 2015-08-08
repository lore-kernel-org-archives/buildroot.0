From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:26 -0000
Subject: [Buildroot] [git commit branch/next] Config.in: remove
	BR2_DEPRECATED_SINCE_2014_05
Message-ID: <20150808105603.D439D7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7b8f43410e9b9e9afca438d08defbdb40566fc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The symbol is unused so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index eaf47dd..e10427f 100644
--- a/Config.in
+++ b/Config.in
@@ -296,10 +296,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2014_05
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2014_08
 	bool
 	default y
