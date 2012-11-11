From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:15:00 +0100
Subject: [Buildroot] [PATCH 22/23] manual: add deprecated-list.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-23-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/deprecated-list.txt

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
-- 
1.8.0
