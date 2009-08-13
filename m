From: Will Newton <will.newton@gmail.com>
Date: Thu, 13 Aug 2009 14:28:33 +0100
Subject: [Buildroot] Buildroot and OpenEmbedded
In-Reply-To: <5f2b60908130604i7175f89h533d1b8f8444e60f@mail.gmail.com>
References: <5f2b60908130604i7175f89h533d1b8f8444e60f@mail.gmail.com>
Message-ID: <87a5b0800908130628i760f152eu84237eb985227c36@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/8/13 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> Hi all,
>
> When I started out with embedded Linux, Buildroot was of great help.
> It built a working cross toolchain and a rootfs for me and I was very
> pleased with it. (Thanks a lot to all developers!) At the same time I
> had tried OpenEmbedded (OE) without much of a success: it was too
> complex for me and I could not get it to build anything. Now, about
> two years later, I started using OE at work and have had very good
> experiences with it. So good that I must think carefully about why I
> should use Buildroot for my next project, and not OE. I guess the main
> reason (for me at least) for thinking about using Buildroot is its
> easy menu configuration. But at the same time it feels like OE has
> more to offer in terms of its build system and its package set.
>
> What do you guys think? What does Buildroot provide that OE does not?
> And another thing: could/should the two projects be merged?

The reasons I have chosen buildroot over OpenEmbedded are:

1. Simplicity.

OE seems to have lots of config files and an unfamiliar interface. BR
lets people configure their root fs in the same way as their kernel.

2. Bitbake.

Asking users to install often very recent versions of a leftfield tool
is difficult. BR has a minimum of external dependencies, which is
great when your users insist on using 3 year old distros. ;-)
Also Makefiles are something almost all software engineers understand
so it reduces the support burden for me.

The things I perceive to be better about OE are:

1. Wider range of packages.
2. Probably more vibrant community and more commercial involvement.

But currently I have no plans to move our userbase away from buildroot.
