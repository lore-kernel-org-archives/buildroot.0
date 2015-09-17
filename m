From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 23:56:11 +0200
Subject: [Buildroot] [PATCH v2] microzed: add Avnet Microzed support
In-Reply-To: <1442388911-3719-1-git-send-email-d.viti@infosolution.it>
References: <1442388911-3719-1-git-send-email-d.viti@infosolution.it>
Message-ID: <20150917235611.20ea0e1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Wed, 16 Sep 2015 09:35:11 +0200, Davide Viti wrote:
> Changes are based on Zedboard: Xilinx does not provide a specific DTS
> for Microzed in the kernel tree. It is suggested [1] to use the
> zynq-zed.dts and change the RAM size
> 
> [1] https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856
> 
> Signed-off-by: Davide Viti <d.viti@infosolution.it>
> ---
> Changes v1 -> v2:
>   - Mention reason for using Zedboard DTS (Jan Viktorin)
>   - remove unnecessary spaces from board/avnet/microzed/readme.txt
>     
>  board/avnet/microzed/readme.txt                    | 65 ++++++++++++++++++++++
>  ...eate-microzed-specific-U-Boot-environment.patch | 34 +++++++++++
>  configs/microzed_defconfig                         | 26 +++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 board/avnet/microzed/readme.txt
>  create mode 100644 board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
>  create mode 100644 configs/microzed_defconfig

Thanks, applied, after doing some minor tweaks:

    [Thomas:
     - extend readme.txt to indicate why the same DTB is used for Microzed
       and the Zedboard.
     - add a description + Signed-off-by line in the
       0001-zynq-Create-microzed-specific-U-Boot-environment.patch, by
       re-using the description of the same patch for the Zedboard.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
