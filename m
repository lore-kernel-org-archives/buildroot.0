From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2014 15:16:00 +0100
Subject: [Buildroot] [git commit] joe: needs mmu
Message-ID: <20140207142114.D98279A86D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d91c689686069244ac2e8dc4f6defa2d8e1732f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f92/f920c85244afffe38497459753bf005946001d0d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/joe/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/joe/Config.in b/package/joe/Config.in
index e15b0f2..7b3df82 100644
--- a/package/joe/Config.in
+++ b/package/joe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JOE
 	bool "joe"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Joe's Own Editor
 
