From: =?UTF-8?Q?Jer=C3=B4nimo_Lopes?= <lopesjeronimo@gmail.com>
Date: Mon, 2 Jun 2014 09:39:27 -0300
Subject: [Buildroot] new TI kernel version for beaglebone black
In-Reply-To: <538AE6B7.8030202@gmx.net>
References: <5388F5A2.1080008@ethertek.ca>
	<538AE6B7.8030202@gmx.net>
Message-ID: <CAM5ihG9-XoZYABR5QgKGqPju6bDMfGrfjfMEoLj37JMo1Nw_Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-06-01 5:39 GMT-03:00 Peter K?mmel <syntheticpp@gmx.net>:

> On 30.05.2014 23:18, Dan Pattison wrote:
>
>> Hello All,
>>
>> I have a question that is probably not 100% buildroot related, but was
>> hoping to get some help. I am using buildroot to
>> build a kernel and rootFS for a beaglebone black. Buildroot is awesome
>> and builds everything fine. The board boots up
>> and all packages work properly. Unfortunately, USB seems to be badly
>> broken. In the kernel I have USB driver enabled and
>> USB Announce New Devices turned on. Googling around I find several people
>> with the same problem, hotplug does not work
>> at all, and no device I have tried shows up in dmesg or lsusb on cold or
>> warm boot. A band aid is to use a powered USB
>> hub (have not tried that). Some guys on the beagleboard.org IRC say to
>> try a newer kernel version (3.14 or >) because
>> beaglebone USB is fixed in newer kernel versions. Current buildroot
>> beaglebone black kernel version is 3.12.10
>>
>> In buildroot I used make beaglebone_defconfig.
>> Under the Kernel menu, Custom Git repository is selected.
>> The git URL is https://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>>
>
> BTW, does someone know how this repository relates to
> https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git?
>
> Is the ti-linux-kernel repository _THE_ reference for TI kernels or
> are there better starting points?
>
> When looking for kernel sources also the Arago projects pops up and
> for sure Linaro.
>
> Does someone have a link or an explanation how all these repositories
> relate?
> That would be great!
>
> Many thanks,
> Peter
>
>
>  The custom repository version is 7f280334068b7c875ade51f8f3921ab311f0c824
>> The def config is board/beaglebone/linux-3.12.config
>>
>> How was the custom repository number (7f280334068b7c875ade51f8f3921ab311f0c824)
>> derived? Looking on the TI gitorious
>> site, I see they are working on kernel 3.15. How can I make buildroot use
>> the newer version? How do I find the newer
>> custom repository version? I tried to find my answer with google, but I
>> must not be using the correct search term.
>> Please excuse the newbish questions.
>>
>> Thank you,
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
?
Hi, I would like to add more questions on the discussion, that again is not
related to buildroot.? First off all I'm really a newbie on embedded linux
development.

I'm also working on a beaglebone black project using buildroot to build
all. Recently I need to change some pin modes, and every googling about it,
leads to capemanager, witch is provided by 'beagleboard kernel' (
https://github.com/beagleboard/kernel). Also every one saying something
about compile a kernel to beaglebone points to this kernel (the 3.8
version).

So I've decided to change things on my project to build this kernel outside
buildroot. But I'm not sure about this, witch is the recommended kernel to
use with beaglebone black?

Jer?nimo Lopes?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140602/62555503/attachment.html>
