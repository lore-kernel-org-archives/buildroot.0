From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 09:05:07 +0100
Subject: [Buildroot] [PATCH 2/2] libtirpc: bump to version 1.0.1
In-Reply-To: <5654E0CE.70704@lysator.liu.se>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
 <1446712210-14129-3-git-send-email-peda@lysator.liu.se>
 <20151124194301.5dd9ece4@free-electrons.com>
 <5654DC2A.6060804@lysator.liu.se>
 <20151124230819.58dc05b9@free-electrons.com>
 <5654E0CE.70704@lysator.liu.se>
Message-ID: <20151125090507.3c67ae33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, 24 Nov 2015 23:12:30 +0100, Peter Rosin wrote:

> >> The toolchain does not match my arch, so I couldn't actually test it, but the fix
> > Just curious, which arch are you running? I think this toolchain is a
> > x86 toolchain, so it should work pretty much on every PC out there. But
> > maybe you're using a different platform?
> 
> The toolchain is x86_64 it seems, and I have a plain old x86 kernel on the system
> in question. Yes yes, I could have moved everything over somewhere. But didn't. :-)

Hum, yes, indeed the pre-built Buildroot toolchains are meant to be
used on a x86-64 system, my bad. I'll test your new series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
