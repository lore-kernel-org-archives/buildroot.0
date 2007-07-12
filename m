From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 07:46:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070712144604.9AFE7A65EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 07:46:03 -0700 (Thu, 12 Jul 2007)
New Revision: 19072

Log:
Update Instructions for applying for Buildroot write access

Modified:
   trunk/buildroot/docs/developer.html


Changeset:
Modified: trunk/buildroot/docs/developer.html
===================================================================
--- trunk/buildroot/docs/developer.html	2007-07-12 14:43:44 UTC (rev 19071)
+++ trunk/buildroot/docs/developer.html	2007-07-12 14:46:03 UTC (rev 19072)
@@ -19,12 +19,19 @@
 or more.  If you do not currently have an ssh version 2 DSA key, you can
 generate a key using the command<pre>ssh-keygen -t dsa</pre>  This will
 create the files <pre>/home/&lt;USERNAME&gt;/ssh/id_dsa
-/home/&lt;USERNAME&gt;/.ssh/id_dsa.pub</pre>  You must then send the content
-of 'id_dsa.pub' to me so I can setup your account.  The content of 'id_dsa'
-should of course be kept secret.
+/home/&lt;USERNAME&gt;/.ssh/id_dsa.pub</pre>  
+It is recommended that you generate a key with a "passphrase" for security reasons.
 
 <p>
+Make the file known to the system by running
 
+<pre>ssh-add ~/.ssh/id_dsa</pre>
+
+You must then send the content of 'id_dsa.pub' to me so I can setup your account.  
+The content of 'id_dsa' should of course be kept secret.
+
+<p>
+
 Note that if you would prefer to keep your communications with me
 private, you can encrypt your email using my
 <a href="http://www.codepoet.org/andersen/erik/gpg.asc">public key</a>.
