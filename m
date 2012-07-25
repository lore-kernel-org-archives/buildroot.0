From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 19:50:55 +0200
Subject: [Buildroot] opengl
In-Reply-To: <20120725191343.0f1f0b9c@skate>
References: <CALo-6+jTYZCiEz8zApGC20xo=zgMOfM0wTakoRV4=dVBgp6oCA@mail.gmail.com>
 <20120725191343.0f1f0b9c@skate>
Message-ID: <501031FF.6050302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/12 19:13, Thomas Petazzoni wrote:
> Le Wed, 25 Jul 2012 10:02:56 -0700,
> Charles Krinke<charles.krinke@gmail.com>  a ?crit :
>
>> >  I have a question about opengl and Qt in working with a TI AM3517EVM.
>> >  I can compile and run Qt, no problem, with buildroot, but my
>> >  application guy says opengl will speed up rendering.
>> >
>> >  In looking at make xconfig, I see that libevas, the Enlightment
>> >  libraries have a opengl sub-setting, which is grayed out. It looks
>> >  like this depends on X11.
>> >
>> >  My question is "Is there a way to use opengl wtih Qt with buildroot
>> >  and a) how does opengl connect logically with Qt and b) How to enable
>> >  opengl so Qt can use it?"
> OpenGL on TI stuff requires the proprietary OpenGL implementation from
> TI, and we don't have a package for it in Buildroot at the moment. It
> would however be really great to have it packaged, but if you want to
> work on it, be ready for a fairly complex adventure. Those proprietary
> libraries typically have really nasty build systems, and cause lots of
> pain to integrate properly in a build environment like Buildroot.

  Having gone through that venture myself, I can confirm that this is
painful. I posted patches in January [1], but it was just too complicated
to get it in a form that could be maintainable, so I gave up.

  Regards,
  Arnout

[1] http://lists.busybox.net/pipermail/buildroot/2012-January/049264.html
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
