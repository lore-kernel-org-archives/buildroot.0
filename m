From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 00:04:12 +0100
Subject: [Buildroot] [git commit] docs/manual/contribute.txt: add section
	for preparing patch series
Message-ID: <20160223230639.B48F88074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4311eb0059846d66e390c254849712a1b5a43ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In subsequent patches, we will add more explanation about how to
prepare patches, so it will be worthwhile to have a separate section
for the series preparation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: rewrap to our normal formatting practice.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index b74897d..90c73de 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -182,10 +182,13 @@ _Please, do not attach patches to bugs, send them to the mailing list
 instead_.
 
 If you made some changes to Buildroot and you would like to contribute
-them to the Buildroot project, proceed as follows. Starting from the
-changes committed in your local git view, _rebase_ your development
-branch on top of the upstream tree before generating a patch set. To do
-so, run:
+them to the Buildroot project, proceed as follows.
+
+==== Preparing a patch series
+
+Starting from the changes committed in your local git view, _rebase_
+your development branch on top of the upstream tree before generating
+a patch set. To do so, run:
 
 ---------------------
 $ git fetch --all --tags
