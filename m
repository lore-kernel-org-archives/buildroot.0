From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:14:16 +0200
Subject: [Buildroot] [PATCH 1/2] configs/telit_evk_pro3: add support for
 gcc 5
In-Reply-To: <20170413150737.18203-1-fabio.porcedda@gmail.com>
References: <20170413150737.18203-1-fabio.porcedda@gmail.com>
Message-ID: <20170413221416.52aa7428@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 17:07:36 +0200, Fabio Porcedda wrote:
> Use two official kernel patches to add support for gcc 5:
> 
> commit 71458cfc782eafe4b27656e078d379a34e472adf
> kernel: add support for gcc 5
> 
> commit aeea3592a13bf12861943e44fc48f1f270941f8d
> ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  .../linux/0001-kernel-add-support-for-gcc-5.patch  | 97 ++++++++++++++++++++++
>  ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch | 52 ++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
>  create mode 100644 board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
