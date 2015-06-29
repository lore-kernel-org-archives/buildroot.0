From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 Jun 2015 00:05:21 +0200
Subject: [Buildroot] [PATCH 2/4] a20_olinuxino_micro/readme.txt: add link to
	linux-sunxi.org
In-Reply-To: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>
References: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1435615523-21039-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly state where this information comes from.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 board/olimex/a20_olinuxino_lime/readme.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
index 4a5853b18e0f..6b8391484b92 100644
--- a/board/olimex/a20_olinuxino_lime/readme.txt
+++ b/board/olimex/a20_olinuxino_lime/readme.txt
@@ -15,6 +15,8 @@ And also the mainline kernel works fine even for a basic Linux desktop
 system running on top of a simple framebuffer, which may be good enough for
 the users who do not need fancy 3D graphics or video playback acceleration.
 
+(see http://linux-sunxi.org/Linux_Kernel for more details)
+
 How to build it
 ===============
 
-- 
1.9.1
