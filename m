From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 18:55:32 +0200
Subject: [Buildroot] [PATCHv2 2/2] board: add qemu coldfire support
In-Reply-To: <20160429175308.GA27869@waldemar-brodkorb.de>
References: <20160429175308.GA27869@waldemar-brodkorb.de>
Message-ID: <20160430185532.137b741e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 19:53:08 +0200, Waldemar Brodkorb wrote:
> Add kernel config and defconfig for Qemu Coldfire.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - split off patch
>  - remove unneeded post exec script
>  - use package/busybox minimal config
> ---
>  board/qemu/m68k-mcf5208/linux-4.5.config | 21 +++++++++++++++++++++
>  board/qemu/m68k-mcf5208/readme.txt       |  7 +++++++
>  configs/qemu_m68k_mcf5208_defconfig      | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+)
>  create mode 100644 board/qemu/m68k-mcf5208/linux-4.5.config
>  create mode 100644 board/qemu/m68k-mcf5208/readme.txt
>  create mode 100644 configs/qemu_m68k_mcf5208_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
