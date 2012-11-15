From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:59:55 +0100
Subject: [Buildroot] [git commit] manual: add deprecated-list.txt
Message-ID: <20121115230543.B52B999E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cbd58f013502652e29f7b5ba342cdfd543b485d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/deprecated-list.txt |   46 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/docs/manual/deprecated-list.txt b/docs/manual/deprecated-list.txt
new file mode 100644
index 0000000..6dc87a4
--- /dev/null
+++ b/docs/manual/deprecated-list.txt
@@ -0,0 +1,46 @@
+// -*- mode:doc -*- ;
+
+[[deprecated]]
+Deprecated list
+---------------
+
+The following stuff are marked as _deprecated_ in Buildroot due to
+their status either too old or unmaintained.
+
+// list generated using the followings command:
+// $ git grep -EB4 'depends on BR2_DEPRECATED'
+// and
+// $ git grep -EB4 'depends on BR2_DEPRECATED' | \
+//     grep -Eo '(:|-).*?(config|comment) BR2_.*'
+//
+// Need manual checks and sorting.
+
+* Packages:
+
+** +busybox+ 1.18.x
+** +customize+
+** +lzma+
+** +microperl+
+** +netkitbase+
+** +netkittelnet+
+** +pkg-config+
+** +squashfs3+
+** +ttcp+
+
+* Toolchain:
+
+** +gdb+ 6.8
+** +gdb+ 7.0.1
+** +gdb+ 7.1
+** +kernel headers+ 2.6.37
+** +kernel headers+ 2.6.38
+** +kernel headers+ 2.6.39
+
+* Bootloaders:
+
+** +u-boot+ 2011-06
+** +u-boot+ 2011-09
+
+* Output images:
+
+** squashfs3 image
