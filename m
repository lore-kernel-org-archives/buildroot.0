From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Nov 2020 07:56:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libplist: drop duplicated COPYING
 hash
Message-ID: <20201130065631.13170-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 762119b4c5489352a889c2627eb37906647c375d resulted in a duplicated
line for COPYING hash so drop it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.29.2
