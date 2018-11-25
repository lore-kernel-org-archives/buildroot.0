From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:01:28 +0100
Subject: [Buildroot] [git commit] mmc-utils: drop 1/1 from [PATCH] header in
 0002-fix-overlapping-with-strncpy.patch
Message-ID: <20181202071559.50814815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=897f84f262de6582568fb91ecf22e068564cb1f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package (rightly so) complains about it:

package/mmc-utils/0002-fix-overlapping-with-strncpy.patch:4: generate your
patches with 'git format-patch -N'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mmc-utils/0002-fix-overlapping-with-strncpy.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
index a134dd3c5a..a562845ffa 100644
--- a/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
+++ b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
@@ -1,7 +1,7 @@
 From 1c90a7534658056b884d71ef82dc7ca8bad4271b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
 Date: Wed, 24 Oct 2018 13:00:47 +0200
-Subject: [PATCH 1/1] mmc-utils: fix overlapping with strncpy
+Subject: [PATCH] mmc-utils: fix overlapping with strncpy
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
