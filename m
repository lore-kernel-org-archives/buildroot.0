From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  2 Sep 2007 10:44:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070902174409.0A6F3A45C7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-02 10:44:09 -0700 (Sun, 02 Sep 2007)
New Revision: 19763

Log:
- document BUSYBOX_CONFIG_FILE


Modified:
   trunk/buildroot/docs/README


Changeset:
Modified: trunk/buildroot/docs/README
===================================================================
--- trunk/buildroot/docs/README	2007-09-02 15:28:30 UTC (rev 19762)
+++ trunk/buildroot/docs/README	2007-09-02 17:44:09 UTC (rev 19763)
@@ -32,6 +32,9 @@
 You can specify a config-file for uClibc:
 $ make UCLIBC_CONFIG_FILE=/my/uClibc.config
 
+And you can specify a config-file for busybox:
+$ make BUSYBOX_CONFIG_FILE=/my/busybox.config
+
 To use a non-standart host-compiler (if you do not have 'gcc'),
 make sure that the compiler is in your PATH and that the library paths are
 setup properly, if your compiler is built dynamically:
