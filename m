From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 23:00:57 +0200
Subject: [Buildroot] [git commit] a20_olinuxino_micro/readme.txt: add link
	to linux-sunxi.org
Message-ID: <20150630210143.D5196800E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6dbd8c02ad57abca1b0a116371fc0ce2cffbf28d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly state where this information comes from.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/olimex/a20_olinuxino_lime/readme.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
index 4a5853b..6b83914 100644
--- a/board/olimex/a20_olinuxino_lime/readme.txt
+++ b/board/olimex/a20_olinuxino_lime/readme.txt
@@ -15,6 +15,8 @@ And also the mainline kernel works fine even for a basic Linux desktop
 system running on top of a simple framebuffer, which may be good enough for
 the users who do not need fancy 3D graphics or video playback acceleration.
 
+(see http://linux-sunxi.org/Linux_Kernel for more details)
+
 How to build it
 ===============
 
