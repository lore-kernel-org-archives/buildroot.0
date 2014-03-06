From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:27:14 +0100
Subject: [Buildroot] [git commit] manual: contributing: minor rewording of
	'submitting patches' section
Message-ID: <20140306172753.1E4319B67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1133097cb2b17e36cb203c1f4480af95f7f47c91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes some minor changes to the section about submitting patches.
Content-wise there are little changes.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index b9d2443..a5ae2db 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -164,16 +164,18 @@ Submitting patches
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
 
@@ -185,7 +187,7 @@ This will generate patch files in the +outgoing+ subdirectory,
 automatically adding the +Signed-off-by+ line.
 
 Once patch files are generated, you can review/edit the commit message
-before submitting them using your favorite text editor.
+before submitting them, using your favorite text editor.
 
 Lastly, send/submit your patch set to the Buildroot mailing list:
 
@@ -196,9 +198,9 @@ $ git send-email --to buildroot at buildroot.org outgoing/*
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
@@ -244,7 +246,7 @@ Hereafter the recommended layout:
 ---------------
 Patch title less than 80-character length
 
-Some more paragraph giving some more details.
+A paragraph giving more details.
 
 And yet another paragraph giving more details.
 
