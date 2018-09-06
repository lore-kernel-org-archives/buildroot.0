From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:32:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] qemu: add support for python3
In-Reply-To: <20180904183934.12291-1-aduskett@gmail.com>
References: <20180904183934.12291-1-aduskett@gmail.com>
Message-ID: <20180906213244.37d64517@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Sep 2018 14:39:34 -0400, Adam Duskett wrote:
> qemu 2.12.0 now supports building against python3.
> see: https://wiki.qemu.org/ChangeLog/2.12#Build_Dependencies
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Split the python version check into two seperate checks for
>     readability, one for the target, one for the host.
>   - Fix location of the python version check for target and host.

I've marked as Changes Requested following the request from Baruch to
test if the system-provided Python can be used instead of building our
own.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
