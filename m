From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:24:25 +0200
Subject: [Buildroot] [PATCH v1] configs/raspberrypi*: bump kernel
 version to 676fd5a
In-Reply-To: <20200607220136.4021-1-ps.report@gmx.net>
References: <20200607220136.4021-1-ps.report@gmx.net>
Message-ID: <20200610232425.11aa2a17@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jun 2020 00:01:36 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Now based on 4.19.126 (from 4.19.113).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - fixed compile with gcc-10.1.1 for me:
>     scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> ---
>  configs/raspberrypi0_defconfig       | 2 +-
>  configs/raspberrypi0w_defconfig      | 2 +-
>  configs/raspberrypi2_defconfig       | 2 +-
>  configs/raspberrypi3_64_defconfig    | 2 +-
>  configs/raspberrypi3_defconfig       | 2 +-
>  configs/raspberrypi3_qt5we_defconfig | 2 +-
>  configs/raspberrypi4_64_defconfig    | 2 +-
>  configs/raspberrypi4_defconfig       | 2 +-
>  configs/raspberrypi_defconfig        | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
