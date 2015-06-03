From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Jun 2015 04:16:34 +0200
Subject: [Buildroot] [PATCH] docs/website: link to the Free Electrons
	training materials
In-Reply-To: <1433297794-12521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433297794-12521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433297794-12521-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/docs.html | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index c44ad8b..3bd3172 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -24,7 +24,25 @@ things. It is available as:</p>
 </ul>
 
 <p>If you find any errors (factual, grammatical, whatever) please
-report them to us.</p>
+  report them to us.</p>
+
+<h2>Training</h2>
+
+<p><a href="http://www.free-electrons.com">Free Electrons</a> offers a
+complete <a href="http://free-electrons.com/training/buildroot/">3-days
+training course on Buildroot</a>. They also make the training
+materials freely available:</p>
+
+<ul>
+  <li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf">slides
+      (PDF)</a></li>
+  <li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf">practical
+      labs (PDF)</a></li>
+  <li><a href="http://free-electrons.com/doc/training/buildroot/buildroot-labs.tar.xz">practical
+      labs data (.tar.xz)</a></li>
+</ul>
+
+<h2>Getting support</h2>
 
 <p>If you find that you need help with Buildroot, you can ask for
 help:</p>
-- 
2.1.0
