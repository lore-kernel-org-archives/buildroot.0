From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Mar 2014 22:24:43 +0100
Subject: [Buildroot] [PATCH 2/9] manual/configure.txt: fix typo
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1396041895-29533-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/configure.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 16c86cc..869066a 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
   prefix+ and +External toolchain C library+ options. Then, you have
   to tell Buildroot what your external toolchain supports. If your
   external toolchain uses the 'glibc' library, you only have to tell
-  whether your toolchain supports C\+\+ or not and whether it has
+  whether your toolchain supports C++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
-- 
1.7.9.5
