From: Samuel MARTIN <s.martin49@gmail.com>
Date: Wed, 21 Mar 2012 00:09:53 +0100
Subject: [Buildroot] [PATCH 03/11] manual: update prerequisite.txt
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332285001-12881-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/prerequisite.txt |   67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index f50672b..df1e6a8 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -1,2 +1,69 @@
+[[requirement]]
 System requirements
 -------------------
+
+Buildroot is design to run on Linux system.
+
+Buildroot needs some software to be already installed on the host
+system; hereafter the lists of the mandatory and optional packages
+(packages' name may vary between distribution).
+
+Take care of _installing both runtime and development data_, especially
+for the libraries that may be packaged in 2 distinct packages.
+
+
+[[requirement-mandatory]]
+
+Mandatory packages
+~~~~~~~~~~~~~~~~~~
+
+* Build tools:
+** +build-essential+ (only for Debian based system)
+** +gcc+
+** +g+++
+** +autoconf+
+** +automake+
+** +libtool+
+** +bison+
+** +flex+
+** +gettext+
+** +patch+
+** +gawk+
+
+* Source fetching tools:
+** +curl+
+** +wget+
+** +cvs+
+** +git+
+** +mercurial+
+** +subversion+
+
+* Development libraries:
+** +ncurses5+
+** +lzo2+
+** +lzma+
+** +zlib1+
+** +acl1+
+** +uuid+
+
+* Documentation generation tools:
+** +asciidoc+
+** +texinfo+
+
+[[requirement-optional]]
+
+Optional packages
+~~~~~~~~~~~~~~~~~
+
+* Interface dependencies (requires development libraries):
+** +ncurses5+ to use the 'menuconfig' interface
+** +qt4+ to use the 'xconfig' interface
+** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
+
+* Development libraries:
+** +glib2+
+** +netpbm10+ (for +fbtest+)
+** +python-xcbgen+ (for +Matchbox+ on Debian based system)
+** +jdk+ and and depending on the host system +gcj-compat+ for Java
+development (for +java+, +jamvm+ and +gnu-classpath+)
+
-- 
1.7.9.4
