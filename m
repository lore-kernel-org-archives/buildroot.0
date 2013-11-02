From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 11:35:35 +0100
Subject: [Buildroot] Introducing new package type,
 side to side with generic-package
In-Reply-To: <CAAXf6LWqFR1mPtJ=w8g73R7Ut7m0wxPu_kwgn=ODW1axBx06uQ@mail.gmail.com>
References: <CADYw_JLHofB+VQ2rktw_reWCvAWU9rj7VJ95tgVnW5OujYisow@mail.gmail.com>
 <ca3a5174-c804-48b7-ad60-720f3926223c@email.android.com>
 <CADYw_JJuE71mqxSmQtT1JKLN7d0apTS=DAz+KD7of7n3sVsWnw@mail.gmail.com>
 <CAAXf6LWqFR1mPtJ=w8g73R7Ut7m0wxPu_kwgn=ODW1axBx06uQ@mail.gmail.com>
Message-ID: <20131102113535.685db8fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 2 Nov 2013 11:27:12 +0100, Thomas De Schampheleire wrote:

> The problem with buildroot forks is that many good developments in
> these forks do not flow back into the mainline buildroot. This is not
> only disadvantageous for mainline buildroot, but also for the fork
> that has to keep up-to-date with developments in mainline buildroot.

I fully agree.

> To the community: I was going to propose to create a github mirror for
> buildroot to clarify which is the upstream project, but it seems one
> already exists:
> https://github.com/buildroot/buildroot

Yes. I did create this one, and I try to keep it updated from time to
time. I pushed the latest Buildroot version to it yesterday.

> If I search on github for 'buildroot', I get 227 repository results :-(
> Some are just personal repositories, but others are actual forks, like:
> 
> Amlogic-related:
> https://github.com/Pivosgroup/buildroot-linux
> https://github.com/vDorst/buildroot
> 
> Raspberry Pi:
> https://github.com/nezticle/RaspberryPi-BuildRoot
> https://github.com/gamaral/rpi-buildroot
> https://github.com/huceke/buildroot-rbp
> https://github.com/albertd/buildroot-rpi
> 
> GCW0 (open-source gaming console)
> https://github.com/gcwnow/buildroot
> 
> BeagleBoard/BeagleBone:
> https://github.com/nerves-project/bbone-erlang-buildroot
> https://github.com/MaxGalemin/buildroot
> 
> Maybe we should add something to the website or README regarding
> forks, something saying that we strongly discourage that and are in
> general open in accepting board support in mainline buildroot. But
> what do we do with all the defconfigs and supporting files. I think
> there was some discussion at BDD about that, but I didn't follow it
> well.

There wasn't discussion about this at the latest BDD, but we indeed
discussed it at the FOSDEM 2013 Buildroot Developer Day. See
http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
