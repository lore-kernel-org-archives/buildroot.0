From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:12:14 +0200
Subject: [Buildroot] [PATCH] m68k: remove BR2_GCC_TARGET_ARCH
In-Reply-To: <20160607024522.GA31074@waldemar-brodkorb.de>
References: <20160607024522.GA31074@waldemar-brodkorb.de>
Message-ID: <20160607131214.4af9e906@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Jun 2016 04:45:22 +0200, Waldemar Brodkorb wrote:
> Setting BR2_GCC_TARGET_ARCH is possible, but breaks
> external toolchain users. m68k/cf defconfigs just
> working without it.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  arch/Config.in.m68k | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
