From: Martin Peevski <martin@ronetix.at>
Date: Sat, 29 Sep 2012 17:09:44 +0300
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <5066FE59.9060600@relinux.de>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
 <50643F2A.3010500@ronetix.at> <20120927142124.6abf0a75@skate>
 <5065ADE0.2030801@ronetix.at> <5066F4F9.7080201@ronetix.at>
 <5066FE59.9060600@relinux.de>
Message-ID: <50670128.7090203@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/09/12 16:57, Stephan Hoffmann wrote:
> Am 29.09.2012 15:17, schrieb Martin Peevski:
>> On 28/09/12 17:02, Martin Peevski wrote:
>>> Also want to ask because I was impossible to configure the Buildroot
>>> using Kernel sources from my computer. Is it possible and how? If
>>> it's impossible I can deliver the sources via internet but they are
>>> not in Git repository, is that problem?
> Hi Martin,
>
> you can use a local linux source tree with the source directory override
> mechanism described here: http://free-electrons.com/blog/buildroot-2011-11/
>>> Thanks in advance!
>>> Martin
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>> Hi again! Before response to my previous letter I want to tell you
>> that build together the kernel and the rootfs and my ethernet is still
>> not working. Can you help me resolve the problem, please? Is the
>> ethernet dependent on my Buildroot configuration or may be something
>> another?
> Do you have any further diagnostics like kernel messages or such? Do you
> have a working kernel for your board? If yes, did you double-check
> kernel configuration against the known good one? If no, are you sure
> your hardware is working correctly? Can you set an IP address without
> error messages?
>
> Regards
>
> Stephan
>> Thanks, Martin.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
I'm not build the Kernel with diagnostic information but I have working 
Kernel and may be rootfs because I have command prompt with buildroot. 
Can execute ifconfig command but the response don't show my IP, shows 
only this:
# ifconfig
lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           UP LOOPBACK RUNNING  MTU:16436  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

I think I'm sure that the Kernel is working because with another rootfs 
my Ethernet is working - can read the IP with ifconfig. But I must use 
the rootfs from Buildroot because the small size of it.
