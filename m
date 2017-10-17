From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Oct 2017 21:30:15 +0200
Subject: [Buildroot] [PATCH v1] manual: clarify license file hash check
	during legal-info target
Message-ID: <20171017193015.18265-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 docs/manual/adding-packages-directory.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 809cc97389..c9857a80d3 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -482,7 +482,8 @@ this in a comment line above the hashes.
 
 .Note
 The hashes for license files are used to detect a license change when a
-package version is bumped. For a package with multiple versions (like Qt5),
+package version is bumped. The hashes are checked during the make legal-info
+target run. For a package with multiple versions (like Qt5),
 create the hash file in a subdirectory +<packageversion>+ of that package
 (see also xref:patch-apply-order[]).
 
-- 
2.14.2
