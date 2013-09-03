From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 4 Sep 2013 07:57:12 +0800
Subject: [Buildroot] Why elf2flt is built *after* busybox
In-Reply-To: <20130903193417.1a092fd5@skate>
References: <1378225250.11000.4.camel@phoenix> <20130903193417.1a092fd5@skate>
Message-ID: <CAFRkauBmG1T5UHKaA5tRvGqPFw2eABrPrPSKeO4L-CCOTyfu=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/4 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Axel Lin,
>
> On Wed, 04 Sep 2013 00:20:50 +0800, Axel Lin wrote:
>
>> Just enable elf2flt and start build.
>> From the build log I found the build system build busybox before
>> elf2flt. Is this normal?
>> I thought elf2flt needs to be ready before building other packages?
>
> Because elf2flt support is broken and someone needs to fix it. You've
> already sent several e-mails about this. Gustavo Zacarias is working on
> improving the elf2flt, but on a spare time basis, so it's progressing
> as time and motivation permits.
>
> Sorry to be a bit rude, but if you want things to move forward faster,
> either send patches to fix the problems and get the thing working, or
> hire someone to do this work for you. I'm sure ARM noMMU support in
> Buildroot will improve, because there are more and more Cortex-M
> systems that are capable of running Linux, but it's not something that
> is currently well supported in Buildroot.

Hi Thomas,

I think you totally missed my point.
I ask the question because I try to figure out the issue I found.
I ask the question because I'm leaning using buildroot.
It's good to know someone is working on this issue, however I didn't
mean to push someone to work for me. That is not my intention.

This time my question is: Is it normal elf2flt is built *after* busybox?
(This looks like a new founding to me)
I know elf2ft is broken.
I'm just not sure if the build order is one of the root cause to make
elf2flt broken.
I ask the question because I'm not familiar with buiildroot now, I even
don't know how to specify package build order.
(In this case, move elf2flt build ealier than busybox.)
So I expect someone can answer the question on mailing list.

Note, I'll send patch if I'm pretty sure I have fixed some issue.
But at this moment I just try to dig out the problem.

Regards,
Axel
