From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 23:59:57 +0200
Subject: [Buildroot] [PATCH/autobuild v2 1/7] autobuild-run: fix typo in
	help text
Message-ID: <20170410220003.30421-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 37c2b12..64da088 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -86,7 +86,7 @@ Options:
   -s, --submitter SUBMITTER      name/machine of submitter
                                  Defaults to %(--submitter)s.
   --http-url URL                 URL of resource to submit your results.
-                                 Defaults to $(--http-url)s.
+                                 Defaults to %(--http-url)s.
   --http-login LOGIN             username to send results with
                                  Not set by default.
   --http-password PASSWORD       password to send results with (for security
-- 
2.11.0
