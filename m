From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:21 +0200
Subject: [Buildroot] [git commit] chromebook snow: remove $(HOST_DIR)/usr
	reference from README
Message-ID: <20170705141335.64BD57FC08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85d35c6d3d0e873d114218ae3dfcd0c586a5a59e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/chromebook/snow/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
index e012cb3..1afd949 100644
--- a/board/chromebook/snow/readme.txt
+++ b/board/chromebook/snow/readme.txt
@@ -88,7 +88,7 @@ you will probably want the rootfs to occupy the whole remaining space.
 
 cgpt may be used to check current layout:
 
-	output/host/usr/bin/cgpt show $SD
+	output/host/bin/cgpt show $SD
 
 All sizes and all offsets are in 512-byte blocks.
 
