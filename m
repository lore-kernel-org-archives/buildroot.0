From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 23:36:08 +0200
Subject: [Buildroot] [git commit] manual: clarify license file hash check
	during legal-info target
Message-ID: <20171017212848.05BAB80FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b9c4cd5815774977bd3eaae0277bca9933882d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 809cc97..c9857a8 100644
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
 
