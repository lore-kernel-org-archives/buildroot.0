From: Martin Peevski <martin@ronetix.at>
Date: Sat, 29 Sep 2012 16:17:45 +0300
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <5065ADE0.2030801@ronetix.at>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
 <50643F2A.3010500@ronetix.at> <20120927142124.6abf0a75@skate>
 <5065ADE0.2030801@ronetix.at>
Message-ID: <5066F4F9.7080201@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/09/12 17:02, Martin Peevski wrote:
> On 27/09/12 15:21, Thomas Petazzoni wrote:
>> Dear Martin Peevski,
>>
>> On Thu, 27 Sep 2012 14:57:30 +0300, Martin Peevski wrote:
>>
>>>> I'd rather recommend using the latest mainline version. AT91
>>>> support in mainline is really good.
>>> I think that it's mandatory to use exactly 2.6.30 version because the
>>> Ronetix board isn't included in the main line of any later Kernel.
>> Ok. That said, porting a recent kernel on a AT91SAM9G45 board is
>> probably a matter of a few hours for someone knowledgeable with ARM
>> kernel development, unless the board has some funky peripherals that
>> are not supported in mainline.
>>
>> Best regards,
>>
>> Thomas
>
>
> Hi again! I build only rootfs with Buildroot using the toolchain for 
> building the Kernel in early stage. But the Ethernet have some 
> problems. Find the PHY correctly but can't make ping.
>
> So my suggestion to fix the problem is to build the Kernel and the 
> rootfs together in Buildroot. Shall this thing correct the problem?
>
> Also want to ask because I was impossible to configure the Buildroot 
> using Kernel sources from my computer. Is it possible and how? If it's 
> impossible I can deliver the sources via internet but they are not in 
> Git repository, is that problem?
>
> Thanks in advance!
> Martin
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



Hi again! Before response to my previous letter I want to tell you that 
build together the kernel and the rootfs and my ethernet is still not 
working. Can you help me resolve the problem, please? Is the ethernet 
dependent on my Buildroot configuration or may be something another?

Thanks, Martin.
