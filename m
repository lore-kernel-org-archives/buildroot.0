From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:54:43 +0100
Subject: [Buildroot] [PATCH 1/5] doc: suggest how to add suboptions
In-Reply-To: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
References: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <19e206323149f851e149a40a952129f74af37b85.1321174391.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 058ebad..a262a8c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -24,10 +24,11 @@ config BR2_PACKAGE_LIBFOO
 	  http://foosoftware.org/libfoo/
 ---------------------------
 
-Of course, you can add other options to configure particular things in
-your software. You can look at examples in other packages. The syntax
-of the +Config.in+ file is the same as the one for the kernel Kconfig
-file. The documentation for this syntax is available at
+Of course, you can add other sub-options into a +if
+BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
+in your software. You can look at examples in other packages. The
+syntax of the +Config.in+ file is the same as the one for the kernel
+Kconfig file. The documentation for this syntax is available at
 http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt[]
 
 Finally you have to add your new +libfoo/Config.in+ to
-- 
1.7.4.1
