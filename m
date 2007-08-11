From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 14:58:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070811215854.D1D86A5E18@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 14:58:53 -0700 (Sat, 11 Aug 2007)
New Revision: 19441

Log:
Update documentation with advice on completion

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-08-11 21:53:18 UTC (rev 19440)
+++ trunk/buildroot/docs/buildroot.html	2007-08-11 21:58:53 UTC (rev 19441)
@@ -202,6 +202,33 @@
 $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 </pre>
 
+    <h3><a name="helper_completion" id="helper_completion"></a>
+    Using auto-completion</h3>
+
+    <p>If you are lazy enough that you don't want to type the entire <i>make
+    menuconfig</i> command line, you can enable auto-completion in your shell.
+    Here is how you can do that using <i>bash</i>:</p>
+<pre>
+$ complete -W menuconfig make
+</pre>
+
+    <p>Then just enter the begining of the line, and ask <i>bash</i> to
+    complete it for you by pressing the <i>TAB</i> key:</p>
+<pre>
+$ make me&lt;TAB&gt;
+</pre>
+
+    <p>will result in <i>bash</i> to append <i>nuconfig</i> for you!</p>
+
+    <p>Alternatively, some distributions (of which Debian and Mandriva are but
+    an example) have more powerful make completion. Depending on you
+    distribution, you may have to install a package to enable completion. Under
+    Mandriva, this is <i>bash-completion</i>, while Debian ships it as part of
+    the <i>bash</i> package.</p>
+
+    <p>Other shells, such as <i>zsh</i>, also have completion facilities. See
+    the documentation for your shell.</p>
+
     <h2><a name="custom_targetfs" id="custom_targetfs"></a>Customizing the
     target filesystem</h2>
 
