From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 30 Mar 2014 23:53:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] manual/configure.txt: fix typo
Message-ID: <1396216393-9841-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
v2:
 - remove only one backslash

 docs/manual/configure.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index c1c9477..6ab0c37 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
   prefix+ and +External toolchain C library+ options. Then, you have
   to tell Buildroot what your external toolchain supports. If your
   external toolchain uses the 'glibc' library, you only have to tell
-  whether your toolchain supports C\+\+ or not and whether it has
+  whether your toolchain supports C\++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
-- 
1.7.9.5
