From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Sat, 4 Aug 2012 11:25:40 -0500
Subject: [Buildroot] ext-toolchain-wrapper issues
In-Reply-To: <20120804111932.6e0f0481@skate>
References: <CAE9DZUSdA9fgHZjgNu3bY8Ue4d6V+4o0USbR6_dcOPsCAfxgiQ@mail.gmail.com>
 <20120804111932.6e0f0481@skate>
Message-ID: <CAE9DZUROhjmKaqYqPoYPa0gy2RhxnX0dvQ4+XJ+2Z2nwjQed+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the help.

> Interesting, I'm also working around the Armada 370 and Armada XP. What
> are you doing with this platform?

Building a NAS product.

> The Armada XP support in mainline doesn't need machine type, it uses
> the device tree.

Marvell provides a patch to the 3.0.6 kernel, which definitely
provides machine types.  They have 3 or 4 defconfigs for the Armada
XP.

> Is this Marvell toolchain available somewhere so I can try to reproduce the problem?

You have to get it from Marvell's extranet.  Need to register first.
Pls contact Erez who is the FAE if you need help getting in
(ereza at marvell.com).

> You can modify ext-toolchain-wrapper.c to progressively remove some
> option that it passes to the compiler to see which one is problematic.

I'll do that.  It would be nice to get it figured out.  Will let you
know what I find.

Regards,

Dallas
