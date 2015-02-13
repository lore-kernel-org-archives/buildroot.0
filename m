From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Feb 2015 17:55:10 +0100
Subject: [Buildroot] [PATCH v2 1/1] Added defconfig for RPi2
In-Reply-To: <54DDC2A6.8020309@hebden.net.au>
References: <1423813491-19453-1-git-send-email-james@hebden.net.au>
 <54DDC2A6.8020309@hebden.net.au>
Message-ID: <20150213175510.03c8202e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Hebden,

On Fri, 13 Feb 2015 20:23:50 +1100, James Hebden wrote:
> From: James Hebden <james@hebden.net.au>
> 
> Signed-off-by: James Hebden <james@hebden.net.au>
> ---
> Changes v1 -> v2
> 
>   - Removed custom kernel configuration, used default kernel config for 
> bcm2709
>   - Removed changes to rpi-firmware package, separate patch coming
>   - Enabled EABIhf
> 
> 
>   configs/raspberrypi2_defconfig | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 configs/raspberrypi2_defconfig

Please use "make savedefconfig" to generate the defconfig. Seeing your
defconfig that has lots of prompt-less option values defined, it
clearly appears that you haven't used "make savedefconfig".

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
