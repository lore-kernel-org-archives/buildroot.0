From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Nov 2017 13:20:02 +0100
Subject: [Buildroot] [git commit] Manual: DEVELOPERS file integrity check
Message-ID: <20171108121509.4AF0C811C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7f9f1da6b09a8658e66a46c55b15186921098a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/developers.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index 4e2cd71..a0a3668 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -44,3 +44,5 @@ the +DEVELOPERS+ file for various tasks:
   list the ones that are not handled by any developer. The purpose of
   this option is to help completing the +DEVELOPERS+ file.
 
+- When using without any arguments, it validates the integrity of the
+  DEVELOPERS file and will note WARNINGS for items that don't match.
