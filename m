From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 1 Feb 2016 18:45:15 +0100
Subject: [Buildroot] [PATCH 2/4] website: add reference to
	submitting-patches to Contribute tab
In-Reply-To: <1454348717-4711-1-git-send-email-arnout@mind.be>
References: <1454348717-4711-1-git-send-email-arnout@mind.be>
Message-ID: <1454348717-4711-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the hope of improving the quality of patches send by newcomers,
add a reference to the submitting-patches section of the manual
to the Contribute tab of the website.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Warning: I haven't been able to test this with the full website js and
css, just with file:///.../docs/website/contribute.html. But I think it
should be OK :-)
---
 docs/website/contribute.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index da5700c..721729b 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -22,7 +22,8 @@
 	    patchwork</a>.</li>
 	<li>Working on items from the
 	  <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
-	<li>Submitting your own patches through the
+	<li><a href="http://buildroot.org/manual.html#submitting-patches">Submitting
+	  your own patches</a> through the
 	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
 	</a></li>
       </ul>
-- 
2.7.0
