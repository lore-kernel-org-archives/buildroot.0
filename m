From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 09:41:17 +0100
Subject: [Buildroot] [git commit] coreutils: correct next version in patch
	description
Message-ID: <20140212084614.9C34D9C9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48c9548ce796186fa15632fe474198e980e41220
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch that commit a728e2fe35 (coreutils: fix build against uclibc
snapshot) adds mentions the wrong coreutils version in its description.

Also fix the sign-of tag while at it.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils-01-spawn-uclibc.patch |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils-01-spawn-uclibc.patch b/package/coreutils/coreutils-01-spawn-uclibc.patch
index 47609b7..a67921b 100644
--- a/package/coreutils/coreutils-01-spawn-uclibc.patch
+++ b/package/coreutils/coreutils-01-spawn-uclibc.patch
@@ -11,9 +11,9 @@ Patch status: suggested by gnulib maintainer
 (http://article.gmane.org/gmane.comp.lib.gnulib.bugs/33610), not in upstream
 gnulib yet
 
-This issue should be fixed in coreutils version 2.23.
+This issue should be fixed in coreutils version 8.23.
 
-Sign-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
 
 diff --git a/m4/spawn_h.m4 b/m4/spawn_h.m4
