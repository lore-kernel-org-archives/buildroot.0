From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:24:21 +0100
Subject: [Buildroot] [git commit] docs/manual: slightly compactify a
	paragraph
Message-ID: <20160119212439.1F6427FD1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04d8fee3d7dd826de5376e153634d2bad2605cf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
