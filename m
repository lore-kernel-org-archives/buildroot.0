From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:27:47 +0100
Subject: [Buildroot] [git commit] manual: contributing: modify commit
	message template
Message-ID: <20140306172753.4EE699B67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4319fbeff2c1809a210e9ff93f950be58da11172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the commit message template provided in the manual.
The new template emphasizes the importance of providing a description of the
problem, the root cause, and the solution, and the fact that all this should
be wrapped at 72 characters.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 9eca691..52d4d04 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -244,13 +244,20 @@ be preserved forever in the +git+ history of the project.
 Hereafter the recommended layout:
 
 ---------------
-Patch title less than 80-character length
+Patch title: short explanation, max 72 chars
 
-A paragraph giving more details.
+A paragraph that explains the problem, and how it manifests itself. If
+the problem is complex, it is OK to add more paragraphs. All paragraphs
+should be wrapped at 72 characters.
 
-And yet another paragraph giving more details.
+A paragraph that explains the root cause of the problem. Again, more
+than on paragraph is OK.
+
+Finally, one or more paragraphs that explain how the problem is solved.
+Don't hesitate to explain complex solutions in detail.
+
+Signed-off-by: John DOE <john.doe@example.net>
 
-Signed-off-by: John Doe <john.doe@noname.org>
 ---
 Changes v2 -> v3:
   - foo bar  (suggested by Jane)
