From: Samuel MARTIN <s.martin49@gmail.com>
Date: Sun, 18 Mar 2012 09:54:00 +0100
Subject: [Buildroot] [PATCH 2/5] docs/buildroot.html: add new manual
	location and warning about this page
In-Reply-To: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
References: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332060843-2786-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/buildroot.html |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 28aefe4..a01e1fc 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -37,6 +37,21 @@
       <li><a href="#links">Resources</a></li>
     </ul>
 
+    <p><b>WARNING:</b> Since the 2011.11 release, this page is on its way to be
+    deprecated. Information may be incomplete and out-dated.</p>
+
+    <p>To get an up-to-date documentation for
+    <a href="http://buildroot.net/">Buildroot</a>-2011.11 or a git view, just
+    run:</p>
+<pre>
+  $ make manual
+</pre>
+    <p><i>This requires <code>asciidoc</code> installed on the host system.</i></p>
+
+    <p>For releases since <a href="http://buildroot.net/">Buildroot</a>-2012.02,
+    manuals (html, pdf and text) are available in the  <code>docs/manual</code>
+    directory.</p>
+
     <h2 id="about">About Buildroot</h2>
 
     <p>Buildroot is a set of Makefiles and patches that allows you to easily
-- 
1.7.9.4
