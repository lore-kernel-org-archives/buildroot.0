From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 22:05:03 +0100
Subject: [Buildroot] [git commit] docs/buildroot.html: add new manual
	location and warning about this page
Message-ID: <20120318215010.11D2790D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e06a030e6bc95bc55f4bfcebd5e80a03f48233f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

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
