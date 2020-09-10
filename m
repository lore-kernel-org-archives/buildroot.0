From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Thu, 10 Sep 2020 11:40:29 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
In-Reply-To: <20200909221101.327887ca@windsurf.hq.k.grp>
References: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
 <20200909221101.327887ca@windsurf.hq.k.grp>
Message-ID: <CAOiXNkAW-_HZPMGzZSezjNDu=wyKN6eiiokfOXBkBaAce+SMLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> > I am just wondering if anybody tried and managed to run Weston on
> > stm32mp157c-dk2 using Buildroot? If yes, I would appreciate any
> > details on what should be done for it.
> >
> > My attempts lead me to the point where the following output comes from
> > weston-launch:
> >
> > # openvt -c 3 -v weston-launch -- --log=weston.log
>
> Which OpenGL implementation are you trying to use? The proprietary
> blobs from Vivante, or the open-source Etnaviv implementation? I don't
> know if the latter was tested on STM32MP157.

Good question. In fact, I am not sure :-) . So I guess it is Etnaviv
because I did nothing to add proprietary blobs. I will check it out
and see what is used by Yocto-based distribution provided by STM where
Weston works.

Thank you,
Andrey.
