From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:43:21 +0100
Subject: [Buildroot] [git commit] manual: contributing: add section on
	analyzing bug reports
Message-ID: <20140305184353.4B1C590409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e640872eb0de465f635ac3903aa3e53cf6e9bafd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a small section to the manual promoting the reproduction,
analysis and fixing of bug reports.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 9727180..44e155f 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -23,6 +23,16 @@ source code tarball. Git is the easiest way to develop from and directly
 send your patches to the mailing list. Refer to xref:getting-buildroot[]
 for more information on obtaining a Buildroot git tree.
 
+Reproducing, analyzing and fixing bugs
+--------------------------------------
+
+A first way of contributing is to have a look at the open bug reports in
+the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot bug
+tracker]. As we strive to keep the bug count as small as possible, all
+help in reproducing, analyzing and fixing reported bugs is more than
+welcome. Don't hesitate to add a comment to bug reports reporting your
+findings, even if you don't yet see the full picture.
+
 [[submitting-patches]]
 Submitting patches
 ------------------
