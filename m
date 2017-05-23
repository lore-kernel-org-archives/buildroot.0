From: David Lechner <david@lechnology.com>
Date: Tue, 23 May 2017 13:04:03 -0500
Subject: [Buildroot] [PATCH 0/3] LEGO MINDSTORMS EV3 updates
Message-ID: <1495562646-4410-1-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are a few more updates for LEGO MINDSTORMS EV3 based on feedback from my
recent patch to use the mainline kernel [1].

I have boot-tested both the flash image and the SD card image.


[1]: http://patchwork.ozlabs.org/patch/762767/

David Lechner (3):
  lego: ev3: Bump U-Boot version
  lego: ev3: Use genimage to rename uImage file
  lego: ev3: Use ext4 file system

 board/lego/ev3/genimage.cfg  | 4 ++--
 board/lego/ev3/post-image.sh | 2 --
 configs/lego_ev3_defconfig   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.7.4
