From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:15:43 +0200
Subject: [Buildroot] [PATCH] package/opencv: disable toolchains affected
 by PR19405
In-Reply-To: <1463301803-15333-1-git-send-email-romain.naour@gmail.com>
References: <1463301803-15333-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160515211543.153f2279@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 May 2016 10:43:23 +0200, Romain Naour wrote:
> opencv libphoto fail to link with the following error:
> nios2-linux-gnu/bin/ld: BFD (Sourcery CodeBench Lite 2015.11-130) 2.25.51
> assertion fail binutils-src-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu/bfd/elf32-nios2.c:1908
> 
> Fixes:
> http://autobuild.buildroot.net/results/fd0cc1cb09d07be94770d984efb28eea7c6f25b7
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/opencv/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
