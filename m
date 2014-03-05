From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Mar 2014 17:24:33 +0100
Subject: [Buildroot] [PATCH 7 of 8] manual: contributing: don't recommend
 leaving out changelog from patches
In-Reply-To: <patchbomb.1394036666@argentina>
References: <patchbomb.1394036666@argentina>
Message-ID: <e95d3b84bcc4048fed60.1394036673@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the manual states that if you send a series and include a
changelog in the introduction mail (0 of x), it is not necessary to include
a changelog on the individual patches.
I don't like this: for large patch series it requires going back to the
introduction mail when opening each patch, to understand what changed.
This patch rewords the paragraph accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/contribute.txt |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -220,8 +220,8 @@ Patch revision changelog
 When improvements are requested, the new revision of each commit
 should include a changelog of the modifications between each
 submission. Note that when your patch series is introduced by a cover
-letter, the changelog may be added in the cover letter rather than in
-the individual commits.
+letter, an overall changelog may be added to the cover letter in
+addition to the changelog in the individual commits.
 
 When added to the individual commits, this changelog is added when
 editing the commit message.  Below the +Signed-off-by+ section, add
