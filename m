From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Sat, 15 Jul 2017 12:31:40 +0200
Subject: [Buildroot] [PATCH 4/4] configs: raspberrypi3_64_defconfig:
 enable uart
In-Reply-To: <5969a4dfeb1b5_7fcd130b1a4601dd@ultri3.mail>
References: <1500014931-5599-4-git-send-email-erik.stromdahl@gmail.com>
 <5969a4dfeb1b5_7fcd130b1a4601dd@ultri3.mail>
Message-ID: <45fb0ba7-3682-7e5a-2843-e700fa338368@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 2017-07-15 07:15, Ricardo Martincoski wrote:
> Hello,
> 
> On Fri, Jul 14, 2017 at 03:48 AM, Erik Stromdahl wrote:
> 
>> This patch is necessary to preserve the same behaviour as
>> before the --uart-enable option in post-image.sh was
> 
> s/--uart-enable/--enable-uart/
Right, bad commit comment indeed.
I'll change the comment.

> 
>> introduced.
> 
> Also, to me it looks like patch 3 and 4 should be merged.
> Let's see what others think.
> 
I was actually thinking about this, but then I couldn't figure out a nice
header for the combined commit.

> [snip]
>> -BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --enable-uart)"
>                                                         ^
> I guess you meant
> BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --enable-uart"
Oops, the parenthesis in the end was not intended!

> 
> Regards,
> Ricardo
> 
