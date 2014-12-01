From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 20:06:55 +0100
Subject: [Buildroot] [git commit] Remove BR2_DEPRECATED_SINCE_2013_11
Message-ID: <20141201190932.6ED3D7FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9125f60722ac3ac89ea6e60d5c9ac0a40b997945
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symbol is unused so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
