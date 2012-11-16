From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 16 Nov 2012 07:13:33 +0100
Subject: [Buildroot] [PATCH 2/2] manual: contribute.txt: do not use
	--summary option with 'git format-patch'
In-Reply-To: <1353046413-3015-1-git-send-email-s.martin49@gmail.com>
References: <1353046413-3015-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353046413-3015-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/contribute.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.0
