From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 06 Mar 2014 11:07:35 +0100
Subject: [Buildroot] [PATCH 7 of 7] manual: contributing: modify commit
	message template
In-Reply-To: <patchbomb.1394100448@argentina>
References: <patchbomb.1394100448@argentina>
Message-ID: <d8c7418a18af92f60eb8.1394100455@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the commit message template provided in the manual.
The new template emphasizes the importance of providing a description of the
problem, the root cause, and the solution, and the fact that all this should
be wrapped at 72 characters.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

 docs/manual/contribute.txt |  15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -244,13 +244,20 @@ be preserved forever in the +git+ histor
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
 
-Signed-off-by: John Doe <john.doe@noname.org>
+Finally, one or more paragraphs that explain how the problem is solved.
+Don't hesitate to explain complex solutions in detail.
+
+Signed-off-by: John DOE <john.doe@example.net>
+
 ---
 Changes v2 -> v3:
   - foo bar  (suggested by Jane)
