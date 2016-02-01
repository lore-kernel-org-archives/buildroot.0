From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 1 Feb 2016 18:45:14 +0100
Subject: [Buildroot] [PATCH 1/4] README: add reference to submitting-patches
In-Reply-To: <1454348717-4711-1-git-send-email-arnout@mind.be>
References: <1454348717-4711-1-git-send-email-arnout@mind.be>
Message-ID: <1454348717-4711-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the hope of improving the quality of patches send by newcomers,
add a reference to the submitting-patches section of the manual
to the top-level README file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index e863f0e..c617252 100644
--- a/README
+++ b/README
@@ -21,3 +21,6 @@ Buildroot comes with a basic configuration for a number of boards. Run
 Please feed suggestions, bug reports, insults, and bribes back to the
 buildroot mailing list: buildroot at buildroot.org
 You can also find us on #buildroot on Freenode IRC.
+
+If you would like to contribute patches, please read
+https://buildroot.org/manual.html#submitting-patches
-- 
2.7.0
