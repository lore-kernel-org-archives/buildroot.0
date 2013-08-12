From: Andreas Larsson <andreas@gaisler.com>
Date: Mon, 12 Aug 2013 16:17:56 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
	BR2_ARCH_HAS_GCC_x_y_PLUS
In-Reply-To: <20130806203906.GA26700@merkur.ravnborg.org>
References: <1367570270-2242-1-git-send-email-mjonker@synopsys.com>
 <5183E67C.9040202@mind.be> <20130503234844.028d28f3@skate>
 <CAAXf6LVsXBeGKqJ=M+HHN7ZdxbpWVSM9qAZiF1eYGz0drv1vzA@mail.gmail.com>
 <20130806203906.GA26700@merkur.ravnborg.org>
Message-ID: <5208EE94.8090905@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-08-06 22:39, Sam Ravnborg wrote:
> On Wed, Jul 31, 2013 at 08:53:15AM +0200, Thomas De Schampheleire wrote:
>> Hi Sam, Konrad,
>>
>> On Fri, May 3, 2013 at 11:48 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Arnout Vandecappelle,
>>>
>>> On Fri, 03 May 2013 18:31:56 +0200, Arnout Vandecappelle wrote:
>>>
>>>>    I'm not very excited about the sparcleon situation. But perhaps that
>>>> architecture can be deprecated? It's not even in our autobuilders AFAIK.
>>>
>>> I think we had one guy interested in the SPARC Leon support. I remember
>>> proposing to remove SPARC support entirely, and one person stepped up
>>> to say that he was using SPARC Leon stuff. See
>>> http://lists.busybox.net/pipermail/buildroot/2010-July/036382.html.
>>>
>>> I don't think Sam ever sent any patch related to SPARC support.
>>>
>>> However, Konrad Eisele sent a bunch of SPARC related patches. However,
>>> the last SPARC-related patches Konrad has sent have been sent on
>>> November 2010. He later sent some other patches (November 2011), but
>>> they were kconfig related, and were extensions to the kconfig language,
>>> something we're not ready to accept if they are not part of the
>>> upstream kconfig code in the Linux kernel.
>>>
>>> I've added Sam and Konrad in Cc to see if they are still using SPARC
>>> support, and whether it's worth adding a sparc sample to our
>>> autobuilders.
>>
>> I'm reviving this older thread.
>> Are any of you still interested in SPARC support in buildroot (see above) ?
>
> My SPARC usage is very basic. I use a toolchain build using crosstoll-ng.
> I added very basic SPARC support to crosstool-ng for this same purpose.
>
> And then I have used buildroot to create a minimal rootfs that contains
> busybox and almost nothing else.
> I use this rootfs to check that the kernel can boot into user-space.
> And so far alll effort from my side has been on the kernel side of things,
> and for that I have used the same rotfs for more than a year.
>
> Recently (the last year os so) I have had limited spare time for kernel/sparc
> activities - so even on the kernel side not much activity has been seen.
>
> So I cannot say that I can be considered a SPARC user of buildroot,
> considering the limited effort I can put in these days.
> So I would hate it - but you cannot justify keeping SPRC support just
> because I am hanging around.
>
> I have added a few more gaisler people - maybe they can say more about
> their potential use of buildroot.

[Resending, as my first answer got stuck in moderation queue due to too 
many people in cc]

Hi!

We, Aeroflex Gaisler, and customers of ours are actively using buildrot. 
Our Linux build environment for Leon SPARC systems that we ship to 
customers are using buildroot. Furthermore, we also have customers that 
are using buildroot out of the box outside our build environment.

So dropping SPARC support for buildroot would be a very bad thing.

Thanks Sam for cc:ing some more Aeroflex Gaisler people.

Best Regards,
Andreas Larsson
