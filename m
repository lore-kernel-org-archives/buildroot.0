From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Sep 2012 14:21:24 +0200
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <50643F2A.3010500@ronetix.at>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
 <50643F2A.3010500@ronetix.at>
Message-ID: <20120927142124.6abf0a75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Peevski,

On Thu, 27 Sep 2012 14:57:30 +0300, Martin Peevski wrote:

> > I'd rather recommend using the latest mainline version. AT91
> > support in mainline is really good.
> 
> I think that it's mandatory to use exactly 2.6.30 version because the 
> Ronetix board isn't included in the main line of any later Kernel.

Ok. That said, porting a recent kernel on a AT91SAM9G45 board is
probably a matter of a few hours for someone knowledgeable with ARM
kernel development, unless the board has some funky peripherals that
are not supported in mainline.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
