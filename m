From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:27 +0200
Subject: [Buildroot] [PATCH v4 10/36] chromebook snow: remove
	$(HOST_DIR)/usr reference from README
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/chromebook/snow/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
index e012cb3f9f..1afd949829 100644
--- a/board/chromebook/snow/readme.txt
+++ b/board/chromebook/snow/readme.txt
@@ -88,7 +88,7 @@ you will probably want the rootfs to occupy the whole remaining space.
 
 cgpt may be used to check current layout:
 
-	output/host/usr/bin/cgpt show $SD
+	output/host/bin/cgpt show $SD
 
 All sizes and all offsets are in 512-byte blocks.
 
-- 
2.13.2
