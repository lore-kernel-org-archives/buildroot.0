From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:27:24 +0100
Subject: [Buildroot] [git commit] manual: contributing: don't recommend
	leaving out changelog from patches
Message-ID: <20140306172753.2C03B9B67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b556772b62d61b6a19594cff7796b46a94e70e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the manual states that if you send a series and include a
changelog in the introduction mail (0 of x), it is not necessary to include
a changelog on the individual patches.
This is not always convenient: for large patch series it requires going back
to the introduction mail when opening each patch, to understand what
changed.
This patch rewords the paragraph accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index a5ae2db..fb22bfb 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -228,8 +228,8 @@ Patch revision changelog
 When improvements are requested, the new revision of each commit
 should include a changelog of the modifications between each
 submission. Note that when your patch series is introduced by a cover
-letter, the changelog may be added in the cover letter rather than in
-the individual commits.
+letter, an overall changelog may be added to the cover letter in
+addition to the changelog in the individual commits.
 
 When added to the individual commits, this changelog is added when
 editing the commit message.  Below the +Signed-off-by+ section, add
