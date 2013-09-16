From: Ralph Siemsen <ralphs@netwinder.org>
Date: Mon, 16 Sep 2013 09:07:28 -0400
Subject: [Buildroot] [PATCH] Trivial documentation fix for Signed-off-by
Message-ID: <20130916130728.GA30181@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make consistent the capitalization and punctuation of Signed-of-by examples.

Signed-off-by: Ralph Siemsen <ralphs@netwinder.org>
---
 docs/manual/contribute.txt   | 4 ++--
 docs/manual/patch-policy.txt | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 3736d61..2b2783d 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -40,7 +40,7 @@ $ git format-patch -M -n -s -o outgoing origin/master
 ---------------------
 
 This will generate patch files in the +outgoing+ subdirectory,
-automatically adding the +signed-off-by+ line.
+automatically adding the +Signed-off-by+ line.
 
 Once patch files are generated, you can review/edit the commit message
 before submitting them using your favorite text editor.
@@ -106,7 +106,7 @@ Some more paragraph giving some more details.
 
 And yet another paragraph giving more details.
 
-Signed-off-by John Doe <john.doe@noname.org>
+Signed-off-by: John Doe <john.doe@noname.org>
 ---
 Changes v2 -> v3:
   - foo bar  (suggested by Jane)
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index d2250ad..2439cc6 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -105,7 +105,7 @@ At the end, the patch should look like:
 ---------------
 configure.ac: add C++ support test
 
-signed-off-by John Doe <john.doe@noname.org>
+Signed-off-by: John Doe <john.doe@noname.org>
 
 --- configure.ac.orig
 +++ configure.ac
-- 
1.8.3.1
