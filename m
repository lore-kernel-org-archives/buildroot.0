From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Sat, 29 Apr 2017 13:43:46 +0100
Subject: [Buildroot] [PATCH 2/2] ne10: Add aarch64 configuration option
In-Reply-To: <20170429140953.0b7badef@free-electrons.com>
References: <1493418486-109149-1-git-send-email-g4@novadsp.com>
 <1493418486-109149-2-git-send-email-g4@novadsp.com>
 <20170429140953.0b7badef@free-electrons.com>
Message-ID: <119901d2c0e6$3e1a7ca0$ba4f75e0$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> 
> But I believe you should in fact rework your patches:
> 
>  - One patch that just bumps ne10, keeping only the ARM support
> 
>  - One patch that refactors the architecture dependency with a
>    Config.in hidden boolean BR2_PACKAGE_NE10_ARCH_SUPPORTS
> 
>  - One patch that allows to use ne10 on AArch64

OK, I will do that.

BR

Jerry
