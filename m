From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jul 2012 08:27:40 -0300
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <50127A41.6080805@mind.be>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar> <20120727085945.1b6339ab@skate>
 <50126BB3.2070502@zacarias.com.ar> <20120727122843.3b28ddf3@skate>
 <50127A41.6080805@mind.be>
Message-ID: <50127B2C.6000008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 08:23, Arnout Vandecappelle wrote:

> On 07/27/12 12:28, Thomas Petazzoni wrote:
>> But still, PTXdist and OE have it. So it should work somehow. And they
>> don't seem to have bizarre patches.
> 
>  Does the segfault issue also occur on arm or powerpc?  Neither PTXdist
> nor OE is a big i386 user, so maybe they just didn't notice the problem.
> 
>  Regards,
>  Arnout

Gentoo has 5.9 as stable for all major architectures, i'm pretty sure it
works so it's something we're doing different/wrong.
Regards.
