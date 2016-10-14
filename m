From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 14 Oct 2016 11:29:04 +0200
Subject: [Buildroot] [PATCH] docs: update URL to uClibc-ng homepage
Message-ID: <20161014092904.GA32247@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not necessary to update all mentioning of uClibc, but
at least we should point to the right homepage of the used
project.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 docs/manual/configure.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 0cd9f82..0739bc7 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -31,7 +31,7 @@ code for your system. It consists of a compiler (in our case, +gcc+),
 binary utils like assembler and linker (in our case, +binutils+) and a
 C standard library (for example
 http://www.gnu.org/software/libc/libc.html[GNU Libc],
-http://www.uclibc.org/[uClibc]).
+http://www.uclibc-ng.org/[uClibc-ng]).
 
 The system installed on your development station certainly already has
 a compilation toolchain that you can use to compile an application
@@ -81,7 +81,7 @@ by itself a cross-compilation toolchain, before building the userspace
 applications and libraries for your target embedded system.
 
 This backend supports several C libraries:
-http://www.uclibc.org[uClibc],
+http://www.uclibc-ng.org[uClibc-ng],
 http://www.gnu.org/software/libc/libc.html[glibc] and
 http://www.musl-libc.org[musl].
 
-- 
2.1.4
