From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Wed, 17 Nov 2010 19:34:48 +0000
Subject: [Buildroot] Makefile:904: *** missing separator (did you mean TAB
 instead of 8 spaces?). Stop.
Message-ID: <1290022488.23841.4.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
I'm getting this error on a bunch of Makefiles of 
/build/gstreamer-0.10.25/

--- /home/sergio/hardware/moviecube/buildroot/output/build/gstreamer-0.10.25/docs/gst/Makefile.old      2010-11-17 19:31:33.328320197 +0000
+++ /home/sergio/hardware/moviecube/buildroot/output/build/gstreamer-0.10.25/docs/gst/Makefile  2010-11-17 19:31:39.476773540 +0000
@@ -901,7 +901,7 @@
        -cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
        -cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
        cd $(distdir) && rm -f $(DISTCLEANFILES)
-        -gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
+       -gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
 
 .PHONY : dist-hook-local docs
 # Tell versions [3.59,3.63) of GNU make to not export all variables.

fix the problem, in vim 
with set autoindent
type: Ji^M^[


-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101117/aa04fff6/attachment-0001.bin>
