From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 15:43:00 +0200
Subject: [Buildroot] [git commit] Trivial documentation fix for Signed-off-by
Message-ID: <20130916134528.9988D9B76C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7da9ee5bd126d86b5ae54553e4ab10191288056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make consistent the capitalization and punctuation of Signed-of-by examples.

Signed-off-by: Ralph Siemsen <ralphs@netwinder.org>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/contribute.txt   |    4 ++--
 docs/manual/patch-policy.txt |    2 +-
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
index c654d38..d9bc8ca 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -105,7 +105,7 @@ At the end, the patch should look like:
 ---------------
 configure.ac: add C++ support test
 
-signed-off-by John Doe <john.doe@noname.org>
+Signed-off-by: John Doe <john.doe@noname.org>
 
 --- configure.ac.orig
 +++ configure.ac
