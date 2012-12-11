From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Dec 2012 21:25:08 +0100
Subject: [Buildroot] [git commit] util-linux: fix typo in configuration
	option label
Message-ID: <20121212061933.87D3F9A1AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=246b384e4a0ed9503cc9c8e2e72b9cdc45225393
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 43a8444..5eab956 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -62,7 +62,7 @@ config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "build \"rename\""
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
-	bool "build \"chrt, ionice, teskset\""
+	bool "build \"chrt, ionice, taskset\""
 
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "build \"wall\""
