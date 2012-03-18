From: Samuel MARTIN <s.martin49@gmail.com>
Date: Sun, 18 Mar 2012 09:53:59 +0100
Subject: [Buildroot] [PATCH 1/5] docs/buildroot.html: cleanup trailing
	whitespaces
In-Reply-To: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
References: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332060843-2786-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/buildroot.html |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index ddfb20a..28aefe4 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -39,22 +39,22 @@
 
     <h2 id="about">About Buildroot</h2>
 
-    <p>Buildroot is a set of Makefiles and patches that allows you to easily 
-    generate a cross-compilation toolchain, a root filesystem and a Linux 
-    kernel image for your target. Buildroot can be used for one, two or all 
+    <p>Buildroot is a set of Makefiles and patches that allows you to easily
+    generate a cross-compilation toolchain, a root filesystem and a Linux
+    kernel image for your target. Buildroot can be used for one, two or all
     of these options, independently.</p>
 
-    <p>Buildroot is useful mainly for people working with embedded systems. 
-    Embedded systems often use processors that are not the regular x86 
-    processors everyone is used to having in his PC. They can be PowerPC 
+    <p>Buildroot is useful mainly for people working with embedded systems.
+    Embedded systems often use processors that are not the regular x86
+    processors everyone is used to having in his PC. They can be PowerPC
     processors, MIPS processors, ARM processors, etc.</p>
 
-    <p>A compilation toolchain is the set of tools that allows you to 
-    compile code for your system. It consists of a compiler (in our case, 
-    <code>gcc</code>), binary utils like assembler and linker (in our case, 
-    <code>binutils</code>) and a C standard library (for example 
-    <a href="http://www.gnu.org/software/libc/libc.html">GNU Libc</a>, 
-    <a href="http://www.uclibc.org/">uClibc</a> or 
+    <p>A compilation toolchain is the set of tools that allows you to
+    compile code for your system. It consists of a compiler (in our case,
+    <code>gcc</code>), binary utils like assembler and linker (in our case,
+    <code>binutils</code>) and a C standard library (for example
+    <a href="http://www.gnu.org/software/libc/libc.html">GNU Libc</a>,
+    <a href="http://www.uclibc.org/">uClibc</a> or
     <a href="http://www.fefe.de/dietlibc/">dietlibc</a>). The system installed
     on your development station certainly already has a compilation
     toolchain that you can use to compile an application that runs on your
-- 
1.7.9.4
