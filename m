From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:28:21 +0100
Subject: [Buildroot] [git commit] manual/configure.txt: fix typo
Message-ID: <20140329092228.CB72C9C3AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=082dec8ce440236b1477e568f0965f05ad241adb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix to actually use the correct syntax.]

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 16c86cc..9681de0 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -100,7 +100,7 @@ most important ones allow to:
    toolchain should have largefile support (i.e support for files
    larger than 2 GB on 32 bits systems), IPv6 support, RPC support
    (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C++ support or thread support. Depending on
+   internationalization), C\++ support or thread support. Depending on
    which options you choose, the number of userspace applications and
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
@@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
   prefix+ and +External toolchain C library+ options. Then, you have
   to tell Buildroot what your external toolchain supports. If your
   external toolchain uses the 'glibc' library, you only have to tell
-  whether your toolchain supports C\+\+ or not and whether it has
+  whether your toolchain supports C++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
