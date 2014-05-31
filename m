From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 May 2014 09:33:10 +0200
Subject: [Buildroot] [git commit] manual/make-tips.txt: busybox doesn't have
	a savedefconfig target
Message-ID: <20140531073357.123629CE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a3899065e0622df573e8b55a1132a1107cd7eef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So don't mention it here.

Reported-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/make-tips.txt |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 1360943..9fabb6f 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -31,8 +31,7 @@ The result of the search shows the help message of the matching items.
 Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
 
-* +busybox-menuconfig+ and +busybox-savedefconfig+ only work when
-  +busybox+ is enabled;
+* +busybox-menuconfig+ only works when +busybox+ is enabled;
 * +linux-menuconfig+ and +linux-savedefconfig+ only work when
   +linux+ is enabled;
 * +uclibc-menuconfig+ is only available when the uClibc C library is
