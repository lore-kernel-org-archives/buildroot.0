From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:20 +0100
Subject: [Buildroot] [PATCH 28/80 v1] docs/manual: slightly compactify a
	paragraph
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <0fc6c8c218781d9c80ef66b787a010e4287e9c06.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c2d9f75..d0de358 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -39,12 +39,11 @@ itself should be indented with one tab and two spaces, lines should
 not be longer than 72 columns, and it must mention the upstream URL
 of the project.
 
-You can add other sub-options into a +if
-BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
-in your software. You can look at examples in other packages. The
-syntax of the +Config.in+ file is the same as the one for the kernel
-Kconfig file. The documentation for this syntax is available at
-http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
+You can add other sub-options into a +if BR2_PACKAGE_LIBFOO...endif+
+statement to configure particular things in your software. You can look at
+examples in other packages. The syntax of the +Config.in+ file is the same
+as the one for the kernel Kconfig file. The documentation for this syntax is
+available at http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
 
 Finally you have to add your new +libfoo/Config.in+ to
 +package/Config.in+ (or in a category subdirectory if you decided to
-- 
1.9.1
