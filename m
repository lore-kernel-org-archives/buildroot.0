From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 15:32:27 +0200
Subject: [Buildroot] [PATCH] move busybox-minimal.config to be used by
 other noMMU targets
In-Reply-To: <20160429174840.GA27145@waldemar-brodkorb.de>
References: <20160429174840.GA27145@waldemar-brodkorb.de>
Message-ID: <20160430153227.4d50ca87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 19:48:40 +0200, Waldemar Brodkorb wrote:
> Config can be used by other noMMU targets as qemu-system-m68k
> with coldfire emulation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/stmicroelectronics/busybox-minimal.config | 1057 -----------------------
>  configs/stm32f429_disco_defconfig               |    2 +-
>  configs/stm32f469_disco_defconfig               |    2 +-
>  package/busybox/busybox-minimal.config          | 1057 +++++++++++++++++++++++
>  4 files changed, 1059 insertions(+), 1059 deletions(-)
>  delete mode 100644 board/stmicroelectronics/busybox-minimal.config
>  create mode 100644 package/busybox/busybox-minimal.config

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
