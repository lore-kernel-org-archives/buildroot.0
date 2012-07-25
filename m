From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 19:13:43 +0200
Subject: [Buildroot] opengl
In-Reply-To: <CALo-6+jTYZCiEz8zApGC20xo=zgMOfM0wTakoRV4=dVBgp6oCA@mail.gmail.com>
References: <CALo-6+jTYZCiEz8zApGC20xo=zgMOfM0wTakoRV4=dVBgp6oCA@mail.gmail.com>
Message-ID: <20120725191343.0f1f0b9c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 10:02:56 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> I have a question about opengl and Qt in working with a TI AM3517EVM.
> I can compile and run Qt, no problem, with buildroot, but my
> application guy says opengl will speed up rendering.
> 
> In looking at make xconfig, I see that libevas, the Enlightment
> libraries have a opengl sub-setting, which is grayed out. It looks
> like this depends on X11.
> 
> My question is "Is there a way to use opengl wtih Qt with buildroot
> and a) how does opengl connect logically with Qt and b) How to enable
> opengl so Qt can use it?"

OpenGL on TI stuff requires the proprietary OpenGL implementation from
TI, and we don't have a package for it in Buildroot at the moment. It
would however be really great to have it packaged, but if you want to
work on it, be ready for a fairly complex adventure. Those proprietary
libraries typically have really nasty build systems, and cause lots of
pain to integrate properly in a build environment like Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
