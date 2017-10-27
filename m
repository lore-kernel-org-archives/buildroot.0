From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Oct 2017 14:54:02 +0200
Subject: [Buildroot] "Buildroot: what's new" slides
Message-ID: <20171027145402.2404fa4b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tuesday this week, I gave a talk "Buildroot: what's new?" at the
Embedded Linux Conference Europe in Prague. I have published the slides
online at
http://free-electrons.com/pub/conferences/2017/elce/petazzoni-buildroot-whats-new/petazzoni-buildroot-whats-new.pdf.

The room was rather full, I believe perhaps 60-80 people in the
audience, but the projectors were so bright that I couldn't really see,
so perhaps Arnout, Peter or Yann who were in the audience can give
more details.

The talk included a poll. I think about 90% of the room already knew
about Buildroot, and a good 60-70% of the room was already using
Buildroot. Perhaps 30-40% of the room was using OE/Yocto, and less than
10% was using OpenWRT. Note that this is of course not representative
of the build system "market share" since people showing up at a
Buildroot talk are likely to already be interested in this build system
more than in others.

This time around, my talk nicely fit within the time slot, so there has
been some time for questions. The ones that I remember:

 - Is there some support for the Rust language. I mentioned the patches
   from Eric Le Bihan, and said help was definitely welcome.

 - A person asked about syslinux support on the target: we currently
   build syslinux itself for the target, but the tools are built for
   the host, but there are scenarios where the tools are needed on the
   target as well. I had the chance to discuss after the talk with this
   person from Airbus, and I explained how it should probably be done
   (host-syslinux installing the host tools, target syslinux installing
   syslinux itself with an option for the target tools)

 - A person asked how to use Buildroot during application development,
   so I gave some more details about <pkg>_OVERRIDE_SRCDIR and how it's
   intended to work.

Perhaps Arnout, Peter or Yann will remember other questions.

All in all, I think it was a good experience, large audience,
interesting questions and feedback. It is worth mentioning that Yann
gave a Buildroot related talk right after mine, I'm sure he will be
publishing his slides very soon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
