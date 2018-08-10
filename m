From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 23:59:02 +0200
Subject: [Buildroot] [PATCH 1/2] qemu: bump to 2.12.0
In-Reply-To: <20180427154055.23272-1-aduskett@gmail.com>
References: <20180427154055.23272-1-aduskett@gmail.com>
Message-ID: <20180810235902.1912057e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Fri, 27 Apr 2018 11:40:54 -0400, Adam Duskett wrote:
> In addition:
>   - Update 0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
>     with new line numbers and file location.
>   - Remove upstream 0002-memfd-fix-configure-test.patch
>   - Add new options found in 2.12.0 in qemu.mk as disabled.
>   - Remove --with-system-pixman as it's no longer optional.
> 
> Tested with test-pkg:
> 
> ./utils/test-pkg -p qemu -c configs/qemu_min_defconfig
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: SKIPPED
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                 armv5-ctng-linux-gnueabi [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Thanks, I've applied to next. One comment below, though.


>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[aduskett at gmail.com: Update for 2.12.0]
> +Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Once again, please stop adding your SoB and an "Update" comment when
all what is happening is changing line numbers/adjusting to minor
conflicts.

Thanks!

Thoams
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
