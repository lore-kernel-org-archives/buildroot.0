From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:46:56 +0100
Subject: [Buildroot] [PATCH v2 2/4] board/lego/ev3: Create images using
 genimage
In-Reply-To: <1478056556-30242-3-git-send-email-david@lechnology.com>
References: <1478056556-30242-1-git-send-email-david@lechnology.com>
 <1478056556-30242-3-git-send-email-david@lechnology.com>
Message-ID: <20161102174656.73b018bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 22:15:54 -0500, David Lechner wrote:
> This adds a script to create SD card and flash images for LEGO MINDSTORMS
> EV3 using the genimage tool.
> 
> The default kernel config had to be modifed to add support for squashfs
> and to add a ram disk.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  board/lego/ev3/genimage.cfg   | 57 ++++++++++++++++++++++++++++++
>  board/lego/ev3/linux.fragment |  7 ++++
>  board/lego/ev3/post-image.sh  | 14 ++++++++
>  board/lego/ev3/readme.txt     | 80 ++++++++++---------------------------------
>  configs/lego_ev3_defconfig    | 10 +++++-
>  5 files changed, 105 insertions(+), 63 deletions(-)
>  create mode 100644 board/lego/ev3/genimage.cfg
>  create mode 100644 board/lego/ev3/linux.fragment
>  create mode 100755 board/lego/ev3/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
