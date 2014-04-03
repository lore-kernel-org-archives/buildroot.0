From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu,  3 Apr 2014 23:21:07 +0200
Subject: [Buildroot] [PATCH v3 1/1] manual/configure.txt: fix typo
Message-ID: <1396560067-14091-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
v3:
 - rebase on top of the master
v2:
 - remove only one backslash

 docs/manual/configure.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index c1c9477..ee5e65e 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -100,7 +100,7 @@ most important ones allow to:
    toolchain should have largefile support (i.e. support for files
    larger than 2 GB on 32 bits systems), IPv6 support, RPC support
    (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C\++ support or thread support. Depending on
+   internationalization), C++ support or thread support. Depending on
    which options you choose, the number of userspace applications and
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
@@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
   prefix+ and +External toolchain C library+ options. Then, you have
   to tell Buildroot what your external toolchain supports. If your
   external toolchain uses the 'glibc' library, you only have to tell
-  whether your toolchain supports C++ or not and whether it has
+  whether your toolchain supports C\++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
-- 
1.7.9.5
