From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 20:05:36 +0100
Subject: [Buildroot] [git commit] Add BR2_DEPRECATED_SINCE_2015_02
Message-ID: <20141201190932.49B727FFF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=683eedd3a86a369c847b0a02e195691b023a6564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the deprecation of certain features in 2015.02, add
the BR2_DEPRECATED_SINCE_2015_02 symbol.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 8d7081f..e2d3dfd 100644
--- a/Config.in
+++ b/Config.in
@@ -314,6 +314,10 @@ config BR2_DEPRECATED_SINCE_2014_08
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_02
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
