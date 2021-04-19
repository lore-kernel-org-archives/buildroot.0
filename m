From: Anton Leontiev <scileont@gmail.com>
Date: Mon, 19 Apr 2021 19:03:46 +0300
Subject: [Buildroot] [PATCH] docs/manual: document KBUILD_VERBOSE
 environment variable
Message-ID: <20210419160346.6393-1-scileont@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Leontiev <scileont@gmail.com>
---
 docs/manual/common-usage.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 9ba87a8339..699a20fe40 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -69,6 +69,9 @@ to +make+ or set in the environment:
 
 * +HOSTCXX+, the host C++ compiler to use
 * +HOSTCC+, the host C compiler to use
+* +KBUILD_VERBOSE+, KBuild verbosity; it is essentially the same as specifying
+  +V=1+ in make arguments. If set, exports itself and +VERBOSE=1+ to all
+  subprocesses.
 * +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
   the uClibc configuration file, used to compile uClibc, if an
   internal toolchain is being built.
-- 
2.31.1
