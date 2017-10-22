From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:46:33 +0200
Subject: [Buildroot] [git commit] CHANGES: update after netsnmp changes
Message-ID: <20171022143933.1873A80F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2aa34d8cede20d4c8701f20ade9a016fb478b87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CHANGES b/CHANGES
index c942fbf..c60d17d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2017.11-rc1, To be released
+
+	netsnmp: all MIB files are now installed, making the target filesystem a
+	bit bigger than before. To remove unneeded MIBS, you should use a
+	post-build script.
+
 2017.08, Released September 1st, 2017
 
 	Minor fixes.
