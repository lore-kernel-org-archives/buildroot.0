From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 17:16:24 +0100
Subject: [Buildroot] [git commit] docs.html: add links to nightly build of
	manual as well
Message-ID: <20140108161754.D0F9B9C3DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a2494d63bc12dc50e80ad0d768cea2257c047f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The html/pdf/text version of the manual is regenerated from current
git head every 6 hours.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/docs.html |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/docs/docs.html b/docs/docs.html
index 1393498..bd8753c 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -6,12 +6,20 @@
 wish to understand how Buildroot works, or wish to change/extend/fix
 things. It is available as:</p>
 
+<h4>Latest stable release</h4>
 <ul>
   <li><a href="/downloads/manual/manual.html">Online HTML</a></li>
   <li><a href="/downloads/manual/manual.pdf">PDF document</a></li>
   <li><a href="/downloads/manual/manual.text">ASCII text</a></li>
 </ul>
 
+<h4>Nightly build</h4>
+<ul>
+  <li><a href="http://nightly.buildroot.org/manual.html">Online HTML</a></li>
+  <li><a href="http://nightly.buildroot.org/manual.pdf">PDF document</a></li>
+  <li><a href="http://nightly.buildroot.org/manual.text">ASCII text</a></li>
+</ul>
+
 <p>If you find any errors (factual, grammatical, whatever) please
 report them to us.</p>
 
