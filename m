From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:29:30 +0100
Subject: [Buildroot] [PATCH 2/2] qemu-m68k: add new board
In-Reply-To: <20160319172755.GA20286@waldemar-brodkorb.de>
References: <20160319172755.GA20286@waldemar-brodkorb.de>
Message-ID: <20160320152930.2693dec9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 18:27:55 +0100, Waldemar Brodkorb wrote:
> Ethernet is not working, but at least you get a shell and
> can test applications for m68k.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/m68k-q800/linux-4.5.config | 26 ++++++++++++++++++++++++++
>  board/qemu/m68k-q800/readme.txt       |  8 ++++++++
>  configs/qemu_m68k_q800_defconfig      | 25 +++++++++++++++++++++++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 board/qemu/m68k-q800/linux-4.5.config
>  create mode 100644 board/qemu/m68k-q800/readme.txt
>  create mode 100644 configs/qemu_m68k_q800_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
