From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 15 Jul 2017 02:15:11 -0300
Subject: [Buildroot] [PATCH 4/4] configs: raspberrypi3_64_defconfig:
 enable uart
References: <1500014931-5599-4-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <5969a4dfeb1b5_7fcd130b1a4601dd@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jul 14, 2017 at 03:48 AM, Erik Stromdahl wrote:

> This patch is necessary to preserve the same behaviour as
> before the --uart-enable option in post-image.sh was

s/--uart-enable/--enable-uart/

> introduced.

Also, to me it looks like patch 3 and 4 should be merged.
Let's see what others think.

[snip]
> -BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --enable-uart)"
                                                       ^
I guess you meant
BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --enable-uart"

Regards,
Ricardo
