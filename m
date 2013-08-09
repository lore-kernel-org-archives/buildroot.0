From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  9 Aug 2013 12:16:47 +0200
Subject: [Buildroot] [PATCH v3 2/3] manual: tips: document how to build the
	manual
In-Reply-To: <1376043408-9367-1-git-send-email-s.martin49@gmail.com>
References: <1376043408-9367-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1376043408-9367-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "A.R.D" <contact@team-ard.com>

Signed-off-by: A.R.D. <contact@team-ard.com>
Cc: Willy Lambert <lambert.willy@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

changes v2 -> v3:
- typos (spotted by Thomas De S.)
- add cross-refs
- update commit message
---
 docs/manual/make-tips.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index b4a9c12..e87bbf7 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -54,6 +54,23 @@ and target trees, the images and the toolchain):
  $ make clean
 --------------------
 
+.Generating the manual:
+
+The present manual sources are located in the 'docs/manual' directory.
+To generate the manual:
+
+---------------------------------
+ $ make manual-clean
+ $ make manual
+---------------------------------
+
+The manual outputs will be generated in 'output/docs/manual'.
+
+.Notes
+- +asciidoc+ is required to build the documentation (see:
+  xref:requirement-optional[]).
+- There is a known issue that you can't build it under Debian Squeeze.
+
 To delete all build products as well as the configuration:
 
 --------------------
-- 
1.8.3.4
