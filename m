From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:27:35 +0100
Subject: [Buildroot] [git commit] manual: contributing: minor rewording of
	'reporting bugs' section
Message-ID: <20140306172753.42F2B9BDCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c97e35f9b64c25cf0f4f293def5d1b67b9bdb0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes some minor fixes in the section about reporting bugs.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index fb22bfb..9eca691 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -274,16 +274,16 @@ $ git format-patch --subject-prefix "PATCH v4" \
 ---------------------
 
 [[reporting-bugs]]
-Reporting issues/bugs, get help
--------------------------------
+Reporting issues/bugs or getting help
+-------------------------------------
 
 Before reporting any issue, please check
 xref:mailing-list-subscribe[the mailing list archive] in case someone has
 already reported and fixed a similar problem.
 
-However you choose to report bugs or get help,
-xref:bugtracker[opening a bug] or
-xref:mailing-list-subscribe[send a mail to the mailing list], there are
+However you choose to report bugs or get help, either by
+xref:bugtracker[opening a bug] or by
+xref:mailing-list-subscribe[sending a mail to the mailing list], there are
 a number of details to provide in order to help people reproduce and
 find a solution to the issue.
 
@@ -295,11 +295,16 @@ Here is a short list of details to provide in such case:
 * host machine (OS/release)
 * version of Buildroot
 * target for which the build fails
-* package(s) which the build fails
+* package(s) for which the build fails
 * the command that fails and its output
 * any information you think that may be relevant
 
-Additionnally, your can add the +.config+ file.
+Additionally, you should add the +.config+ file (or if you know how, a
++defconfig+).
 
 If some of these details are too large, do not hesitate to use a
-pastebin service (see http://www.similarsitesearch.com/alternatives-to/pastebin.com[]).
+pastebin service. Note that not all available pastebin services will
+preserve Unix-style line terminators when downloading raw pastes.
+Following pastebin services are known to work correctly:
+- https://gist.github.com/
+- http://code.bulix.org/
