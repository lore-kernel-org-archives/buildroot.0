From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:04:35 +0100
Subject: [Buildroot] [PATCH 09/13] docs/manual: mention that custom
	toolchains is also useful for BR toolchains
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393167879-16637-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index a6afafb..42d84fe 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -159,14 +159,14 @@ Then, you have three solutions to use an external toolchain:
   toolchain.
 
 * Use a completely custom external toolchain. This is particularly
-  useful for toolchains generated using crosstool-NG. To do this,
-  select the +Custom toolchain+ solution in the +Toolchain+ list. You
-  need to fill the +Toolchain path+, +Toolchain prefix+ and +External
-  toolchain C library+ options. Then, you have to tell Buildroot what
-  your external toolchain supports. If your external toolchain uses
-  the 'glibc' library, you only have to tell whether your toolchain
-  supports C\+\+ or not and whether it has built-in RPC support. If
-  your external toolchain uses the 'uClibc'
+  useful for toolchains generated using crosstool-NG or with Buildroot
+  itself. To do this, select the +Custom toolchain+ solution in the
+  +Toolchain+ list. You need to fill the +Toolchain path+, +Toolchain
+  prefix+ and +External toolchain C library+ options. Then, you have
+  to tell Buildroot what your external toolchain supports. If your
+  external toolchain uses the 'glibc' library, you only have to tell
+  whether your toolchain supports C\+\+ or not and whether it has
+  built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
   C++. At the beginning of the execution, Buildroot will tell you if
-- 
1.8.3.2
