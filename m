From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:23:44 +0100
Subject: [Buildroot] [PATCH] configs/raspberrypi*: update them to use
 genimage
In-Reply-To: <1451568488-12829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451568488-12829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151231152344.2567ee13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 31 Dec 2015 10:28:08 -0300, Gustavo Zacarias wrote:
> Update the raspberrypi and raspberrypi2 configs to use genimage directly
> to build the image.
> Update the documentation to reflect this, and drop the volatile rootfs
> option since it doesn't make much sense and it's not easily integrated
> with the genimage configurations.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/raspberrypi/genimage-raspberrypi.cfg  |  31 ++++++++
>  board/raspberrypi/genimage-raspberrypi2.cfg |  30 ++++++++
>  board/raspberrypi/post-image.sh             |  22 ++++++
>  board/raspberrypi/readme.txt                | 110 +++++-----------------------
>  configs/raspberrypi2_defconfig              |  11 +++
>  configs/raspberrypi_defconfig               |  11 +++
>  6 files changed, 122 insertions(+), 93 deletions(-)
>  create mode 100644 board/raspberrypi/genimage-raspberrypi.cfg
>  create mode 100644 board/raspberrypi/genimage-raspberrypi2.cfg
>  create mode 100755 board/raspberrypi/post-image.sh

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
