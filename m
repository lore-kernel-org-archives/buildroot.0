From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 17:09:39 +0100
Subject: [Buildroot] [git commit] manual: customize-toolchain.txt: update
	internal backend section
Message-ID: <20131104211054.F0D849BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee1565bf36f42781dfc7d42df8bd1445b4202a2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mention all supported C libraries by the internal Buildroot toolchain
backend.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-toolchain.txt |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

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
 
