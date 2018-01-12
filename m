From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:44:33 +0100
Subject: [Buildroot] [PATCH 2/2] board/ci20: Implement creation of a
 basic sdcard image for ci20
In-Reply-To: <1515514108-18962-2-git-send-email-johannes.schmitz1@gmail.com>
References: <1515514108-18962-1-git-send-email-johannes.schmitz1@gmail.com>
 <1515514108-18962-2-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20180112224433.67e1e95e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 17:08:28 +0100, Johannes Schmitz wrote:
> Add a genimage.cfg to create a working sdcard.img for the ci20 hardware.
> We also need a uboot-env.txt to create the partition for the uboot
> environment.
> 
> Update the board/ci20/readme.txt with the related information. Remove
> the tftp netboot description from the readme as it is already to
> complicated for a basic bootable example.
> 
> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
> ---
>  board/ci20/genimage.cfg  | 29 ++++++++++++++++++++++++++
>  board/ci20/readme.txt    | 54 ++++++++++++++++++++++++++----------------------
>  board/ci20/uboot-env.txt | 10 +++++++++
>  configs/ci20_defconfig   | 11 ++++++++++
>  4 files changed, 79 insertions(+), 25 deletions(-)
>  create mode 100644 board/ci20/genimage.cfg
>  create mode 100644 board/ci20/uboot-env.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
