From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Feb 2014 10:16:10 +0200
Subject: [Buildroot] [PATCH] coreutils: correct next version in patch
	description
Message-ID: <62cd52a8b8954b9f87c1b56b46a5cbde53623358.1392192970.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch that commit a728e2fe35 (coreutils: fix build against uclibc
snapshot) adds mentions the wrong coreutils version in its description.

Also fix the sign-of tag while at it.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/coreutils/coreutils-01-spawn-uclibc.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils-01-spawn-uclibc.patch b/package/coreutils/coreutils-01-spawn-uclibc.patch
index 47609b75bc08..a67921bf2022 100644
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
-- 
1.8.5.3
