From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 08:43:47 +0100
Subject: [Buildroot] [git commit] manual: contribute.txt: do not use
	--summary option with 'git format-patch'
Message-ID: <20121116074438.4B97F9A043@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b04a6d7bda0a0241003a79d026569d6e81e07105
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/contribute.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index ddf790d..b2e6e7d 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -42,8 +42,8 @@ This will generate patch files in the +outgoing+ subdirectory,
 automatically adding the +signed-off-by+ line.
 
 If you want to present the whole patch set in a separate mail, add
-+--cover-letter --summary+ to the previous command line (+man
-git-format-patch+ for further information).
++--cover-letter+ to the previous command line (+man git-format-patch+
+for further information).
 
 Once patch files are generated, you can review/edit the commit message
 before submitting them using your favorite text editor.
