From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:25:58 +0200
Subject: [Buildroot] [PATCH 1/2] raspberrypi2: switch Linux kernel to
 rpi-3.18.y
In-Reply-To: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
References: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150501102558.338835cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Wed, 29 Apr 2015 09:36:43 -0400, Frank Hunleth wrote:
> This changes the kernel used on the Raspberry Pi 2 from the 3.19 branch
> back to the 3.18 branch. This provides a couple of advantages:
> 
>   1. mmc0 works again. Floris Bos found out that this was due to using
>      the precompiled DTB files from rpi-firmware. These DTBs were built
>      using 3.18.
>   2. The rpi-3.18.y branch is not regularly rebased like rpi-3.19.y
>      according to popcornmix. See
>      https://github.com/raspberrypi/linux/issues/915.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  configs/raspberrypi2_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied both patches, thanks.

What about the raspberrypi_defconfig ? Is there any reason to keep it
around using the 3.12 kernel ? Or can we rename
raspberrypi_dt_defconfig to raspberrypi_defconfig ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
