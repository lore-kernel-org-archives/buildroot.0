From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Feb 2011 22:25:58 +0100
Subject: [Buildroot] [git commit master 1/1] devmem2: mark as deprecated
Message-ID: <20110227212630.57F778F77C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=310a7700ad68a03bd9ad9fbf9f5f795e85c9f462
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox has had a devmem applet for a number of years now, so deprecate
the old standalone program.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/devmem2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
index cb00a51..233b4b0 100644
--- a/package/devmem2/Config.in
+++ b/package/devmem2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DEVMEM2
 	bool "devmem2"
+	depends on BR2_DEPRECATED
 	help
 	  Simple program to read/write from/to any location in memory.
 
-- 
1.7.3.4
