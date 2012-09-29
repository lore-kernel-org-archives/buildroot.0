From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 29 Sep 2012 15:57:45 +0200
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <5066F4F9.7080201@ronetix.at>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
 <50643F2A.3010500@ronetix.at> <20120927142124.6abf0a75@skate>
 <5065ADE0.2030801@ronetix.at> <5066F4F9.7080201@ronetix.at>
Message-ID: <5066FE59.9060600@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 29.09.2012 15:17, schrieb Martin Peevski:
> On 28/09/12 17:02, Martin Peevski wrote:
>>
>> Also want to ask because I was impossible to configure the Buildroot
>> using Kernel sources from my computer. Is it possible and how? If
>> it's impossible I can deliver the sources via internet but they are
>> not in Git repository, is that problem?
Hi Martin,

you can use a local linux source tree with the source directory override
mechanism described here: http://free-electrons.com/blog/buildroot-2011-11/
>>
>> Thanks in advance!
>> Martin
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> Hi again! Before response to my previous letter I want to tell you
> that build together the kernel and the rootfs and my ethernet is still
> not working. Can you help me resolve the problem, please? Is the
> ethernet dependent on my Buildroot configuration or may be something
> another?
Do you have any further diagnostics like kernel messages or such? Do you
have a working kernel for your board? If yes, did you double-check
kernel configuration against the known good one? If no, are you sure
your hardware is working correctly? Can you set an IP address without
error messages?

Regards

Stephan
>
> Thanks, Martin.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
