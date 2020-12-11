From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:29:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libplist: drop
 duplicated COPYING hash
Message-ID: <20201211211702.CBAEC866A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af78dfd96f98c3f4ed42eaa4aebba2e4532947bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 762119b4c5489352a889c2627eb37906647c375d resulted in a duplicated
line for COPYING hash so drop it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 26c2db20d83d2d2800f63d97d28dc74fbe2a2625)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplist/libplist.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 9934ad05eb..58054d0b84 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,4 +1,3 @@
 # Locally calculated
 sha256  4b33f9af3f9208d54a3c3e1a8c149932513f451c98d1dd696fe42c06e30b7f03  libplist-2.1.0.tar.gz
 sha256  7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
-sha256 7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
