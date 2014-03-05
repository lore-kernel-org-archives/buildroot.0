From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Mar 2014 17:24:32 +0100
Subject: [Buildroot] [PATCH 6 of 8] manual: contributing: minor rewording of
 'submitting patches' section
In-Reply-To: <patchbomb.1394036666@argentina>
References: <patchbomb.1394036666@argentina>
Message-ID: <e71bbcb3a276227ed93f.1394036672@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes some minor changes to the section about submitting patches.
Content-wise there are little changes.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/contribute.txt |  20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -156,16 +156,18 @@ Submitting patches
 _Please, do not attach patches to bugs, send them to the mailing list
 instead_.
 
-When your changes are done, and committed in your local git view,
-_rebase_ your development branch on top of the upstream tree before
-generating the patch set. To do so, run:
+If you made some changes to Buildroot and you would like to contribute
+them to the Buildroot project, proceed as follows. Starting from the
+changes committed in your local git view, _rebase_ your development
+branch on top of the upstream tree before generating a patch set. To do
+so, run:
 
 ---------------------
 $ git fetch --all --tags
 $ git rebase origin/master
 ---------------------
 
-Here, you are ready to generate then submit your patch set.
+Now, you are ready to generate then submit your patch set.
 
 To generate it, run:
 
@@ -177,7 +179,7 @@ This will generate patch files in the +o
 automatically adding the +Signed-off-by+ line.
 
 Once patch files are generated, you can review/edit the commit message
-before submitting them using your favorite text editor.
+before submitting them, using your favorite text editor.
 
 Lastly, send/submit your patch set to the Buildroot mailing list:
 
@@ -188,9 +190,9 @@ Lastly, send/submit your patch set to th
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or google it.
 
-Make sure posted *patches are not line-wrapped*, otherwise they cannot
-easily be applied. In such a case, fix your e-mail client, or better,
-use +git send-email+ to send your patches.
+If you do not use +git send-email+, make sure posted *patches are not
+line-wrapped*, otherwise they cannot easily be applied. In such a case,
+fix your e-mail client, or better yet, learn to use +git send-email+.
 
 Cover letter
 ~~~~~~~~~~~~
@@ -236,7 +238,7 @@ Hereafter the recommended layout:
 ---------------
 Patch title less than 80-character length
 
-Some more paragraph giving some more details.
+A paragraph giving more details.
 
 And yet another paragraph giving more details.
 
