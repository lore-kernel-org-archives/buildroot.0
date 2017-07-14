From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 14 Jul 2017 16:18:25 -0500
Subject: [Buildroot] [PATCH] package/Makefile.in: Tweak TARGET_ABI for
	MPC8548
In-Reply-To: <20170714225905.6b8b19fe@windsurf>
References: <20170712024737.21578-1-andrew.smirnov@gmail.com>
 <20170712093218.5a6a20ff@windsurf.lan>
 <CAHQ1cqFpf7ggXb=wWnmqHpoScMe-B8wmWO6az2f7RAx72C72OA@mail.gmail.com>
 <20170714225905.6b8b19fe@windsurf>
Message-ID: <CAHQ1cqHMcOpfaCjTk7h3Dg-7FZXa22t5b6D_-nfrpvzt8Q=5HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 14, 2017 at 3:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 14 Jul 2017 14:47:15 -0500, Andrey Smirnov wrote:
>
>> It's been a while, since I investigated this patch, but I believe we
>> were seeing performance improvements on heavily numerical application
>> on our system with "-mhard-float" while using custom built
>> crosstools-ng e500 toolchain. But given how I didn't notice two
>> significant problems with this patch and it is clearly not ready for
>> prime time, let me go back and do more research/double check that I
>> wasn't doing something dumb and missing the obvious.
>>
>> I'll follow up with a separate patch if it's truly useful.
>
> I think it definitely makes sense to continue work on this patch.
> PowerPC is not the most well maintained architecture in Buildroot, so
> it's very good to get contributions from our PowerPC users to improve
> the support for this architecture.
>
> If indeed PowerPC needs an explicit -mhard-float to use the FPU, we'll
> have to fix Buildroot. Could you investigate this a little bit more?
>

Absolutely. Sorry for not being very clear, what I was trying to say
is: I just lost a bit of confidence that this patch is truly
needed(I've been confuse by simpler things before), so I'll go back
and investigate more to either build a better case for it or discover
what I missed.

Thanks,
Andrey Smirnov
