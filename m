From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 22 Dec 2011 13:23:46 +0100
Subject: [Buildroot] Buildroot & GIT branch
In-Reply-To: <DUB105-W15E9847F168C91032A9C6BCDAA0@phx.gbl>
References: <DUB105-W30E0FD52CE9490FC698A25CDAA0@phx.gbl>
 <CAAXf6LVb=h2rObnfJ8RBncyrwo5cONuvDi5c83PaDCbKTxKBWw@mail.gmail.com>
 <DUB105-W15E9847F168C91032A9C6BCDAA0@phx.gbl>
Message-ID: <CAAXf6LXiPEPaQr68Pniu0UYq=p5GwNxJaYcv4h1vxQzehPtoQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 22, 2011 at 1:03 PM, Janne H?meenaho
<jannehameenaho@hotmail.com> wrote:
> Hi,
>
> Thanks for a quick answer. I'm still confused, through. Here's my Kernel
> config. Is it ok, if I need to have "my_branch"?
>
>
> #
> # Kernel
> #
> BR2_LINUX_KERNEL=y
> # BR2_LINUX_KERNEL_3_1 is not set
> # BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
> # BR2_LINUX_KERNEL_CUSTOM_VERSION="my_branch"
> # BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="http://git.my.lan/linux-stable"
> BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="my_branch"
> BR2_LINUX_KERNEL_VERSION="my_branch"
> BR2_LINUX_KERNEL_PATCH=""
> BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> # BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
> BR2_LINUX_KERNEL_DEFCONFIG="my_branch"
> # BR2_LINUX_KERNEL_UIMAGE is not set
> BR2_LINUX_KERNEL_ZIMAGE=y
> # BR2_LINUX_KERNEL_VMLINUX is not set
> # BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
> # BR2_LINUX_KERNEL_INSTALL_TARGET is not set
>

Yes, this should be OK. Did you try it?

Best regards,
Thomas

>
>> Date: Thu, 22 Dec 2011 12:19:40 +0100
>> Subject: Re: [Buildroot] Buildroot & GIT branch
>> From: patrickdepinguin+buildroot at gmail.com
>> To: jannehameenaho at hotmail.com
>> CC: buildroot at uclibc.org
>
>>
>> Hi Janne,
>>
>> On Thu, Dec 22, 2011 at 12:06 PM, Janne H?meenaho
>> <jannehameenaho@hotmail.com> wrote:
>> > Hi,
>> >
>> > Thanks for a great SW! Buildroot is an achievement.
>> >
>> > I'm a new users and I've got a problem:
>> >
>> > I need to use my own branch of Linux kernel GIT repository which is on
>> > my
>> > server. Let's call it my_branch. How do I config Buildroot to pull that
>> > branch?
>> >
>> > Buildroot successfully uses master branch.
>>
>> I think you should put the branch name as Linux kernel version in the
>> configuration.
>>
>> Best regards,
>> Thomas
