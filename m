From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 18 Oct 2013 22:31:34 +0200
Subject: [Buildroot] [PATCH 10/12] manual: customize-toolchain.txt: update
	internal backend section
In-Reply-To: <cover.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
Message-ID: <efd8c09deed6f775d97d179cfa2e6ac242693dc9.1382127504.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mention all supported C libraries by the internal Buildroot toolchain
backend.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-toolchain.txt | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 841dbfd..31c9140 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -31,14 +31,19 @@ set the environment variable BR_DEBUG_WRAPPER to either one of:
 Using the internal Buildroot toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The internal Buildroot toolchain backend *only* allows to generate
-*http://www.uclibc.org/[uClibc]-based toolchains*.
+The internal Buildroot toolchain backend allows to generate toolchains
+based on http://www.uclibc.org/[uClibc],
+https://www.gnu.org/software/libc/[glibc] and
+http://www.eglibc.org/[eglibc].
+Generation of (e)glibc-based toolchains is still experimental in
+Buildroot.
 
-However, it allows to tune major settings, such as:
+It allows to tune major settings, such as:
 
 * Linux headers version;
 
-* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc]);
+* C library configuration (only available for
+  http://www.uclibc.org/[uClibc], see xref:uclibc-custom[uClibc]);
 
 * Binutils, GCC, Gdb and toolchain options.
 
-- 
1.8.4.1
