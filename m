From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:58:29 +0200
Subject: [Buildroot] [git commit] Config.in: remove
	BR2_DEPRECATED_SINCE_2014_05
Message-ID: <20150602205903.A73F17FEB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7b8f43410e9b9e9afca438d08defbdb40566fc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
