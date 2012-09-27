From: Martin Peevski <martin@ronetix.at>
Date: Thu, 27 Sep 2012 14:57:30 +0300
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <20120927115321.73a0e2b4@skate>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
Message-ID: <50643F2A.3010500@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/09/12 12:53, Thomas Petazzoni wrote:
> Dear Martin Peevski,
>
> On Thu, 27 Sep 2012 11:55:51 +0300, Martin Peevski wrote:
>
>>        Hi, I'm back to Buildroot. I new working Linux on board which
>> isn't supported to that moment in Buildroot, I think - AT91SAM9G45 on
>> Ronetix board. Is it possible to build for it?
> Yes, of course.
>
>> Moreover I will use
>> external Kernel which support 9g45 - Kernel version 2.6.30.
> I'd rather recommend using the latest mainline version. AT91 support in
> mainline is really good.

I think that it's mandatory to use exactly 2.6.30 version because the 
Ronetix board isn't included in the main line of any later Kernel.
>
>> That version isn't supported from the Kernel headers, I think? Can you
>> help me build the Linux again?
> Don't worry too much about the kernel headers version, it doesn't have
> to match exactly the kernel you're running. It should just be *older*
> than the kernel version you're running on the board. Also then
>
> Best regards,
>
> Thomas

I'll try with external toolchain which is used to build the already 
build externel used Kernel.
