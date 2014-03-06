From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 06 Mar 2014 11:07:34 +0100
Subject: [Buildroot] [PATCH 6 of 7] manual: contributing: minor rewording of
 'reporting bugs' section
In-Reply-To: <patchbomb.1394100448@argentina>
References: <patchbomb.1394100448@argentina>
Message-ID: <979bfcee73f165aa7129.1394100454@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes some minor fixes in the section about reporting bugs.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: provide an explicit list of 'good' pastebins (Yann)

 docs/manual/contribute.txt |  21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

Although I don't think this section belongs in the Contributing chapter,
there currently isn't a better place. When I get to rethinking the manual
structure, this can be changed.

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -274,16 +274,16 @@ This can be easily handled with +git for
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
 
@@ -295,11 +295,16 @@ Here is a short list of details to provi
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
