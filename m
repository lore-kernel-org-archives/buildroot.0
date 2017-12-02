From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 00:00:48 +0100
Subject: [Buildroot] [git commit] hiredis: add hash for license file
Message-ID: <20171202230428.777E882224@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0f05acdf56988a2da5180d9d52f3652bd63d051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hiredis/hiredis.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 2c788a6..682ec6d 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	717e6fc8dc2819bef522deaca516de9e51b9dfa68fe393b7db5c3b6079196f78	hiredis-v0.13.3.tar.gz
+sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb	COPYING
