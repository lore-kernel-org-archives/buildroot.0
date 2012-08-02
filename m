From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 10:25:23 +0200
Subject: [Buildroot] [git commit branch/next] docs: update links to the
	manual
Message-ID: <20120802195305.EF22D8F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d40d77ff708344a075c0c70a73e1b35efc4e3d62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In addition to the HTML version, also publish the PDF and Text
versions of our manual.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/docs.html |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/docs/docs.html b/docs/docs.html
index 65eaff1..1393498 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -2,10 +2,18 @@
 
 <h3>Documentation</h3>
 
-<p>The <a href="/downloads/manual/manual.html">Buildroot user manual</a>
-is where you want to start reading if you wish to understand how
-Buildroot works, or wish to change/extend/fix things. If you find any
-errors (factual, grammatical, whatever) please report them to us.</p>
+<p>The Buildroot user manual is where you want to start reading if you
+wish to understand how Buildroot works, or wish to change/extend/fix
+things. It is available as:</p>
+
+<ul>
+  <li><a href="/downloads/manual/manual.html">Online HTML</a></li>
+  <li><a href="/downloads/manual/manual.pdf">PDF document</a></li>
+  <li><a href="/downloads/manual/manual.text">ASCII text</a></li>
+</ul>
+
+<p>If you find any errors (factual, grammatical, whatever) please
+report them to us.</p>
 
 <p>If you find that you need help with Buildroot, you can ask for
 help:</p>
