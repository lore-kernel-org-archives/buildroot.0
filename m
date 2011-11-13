From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:20:44 +0100
Subject: [Buildroot] [git commit] doc: suggest how to add suboptions
Message-ID: <20111113203423.710218F53D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=939d0ab264bea00f18cb6085547580df43c50653
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
