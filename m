From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 23 Mar 2020 23:59:55 +0100
Subject: [Buildroot] iputils failures
In-Reply-To: <CAPi7W80h-+Sp_HygfO5LtA23Uc7cWdiPfZcEEoSj1LB9ABLucg@mail.gmail.com>
References: <5e78648f.1c69fb81.748d4.e737SMTPIN_ADDED_MISSING@mx.google.com>
 <20200323210537.GB30642@dell5510>
 <CAPi7W80h-+Sp_HygfO5LtA23Uc7cWdiPfZcEEoSj1LB9ABLucg@mail.gmail.com>
Message-ID: <20200323225955.GA2677836@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

...
> > but that does not help. Is it libiconv failure or iputils failure? And is it
> > buildroot setup problem or upstream issue?
> The issue is due to the meson build system which does not retrieve
> -liconv from libidn2.pc as it does not call pkg-config with --static
> argument.
> I sent a patch to fix this more than one month ago:
> https://patchwork.ozlabs.org/patch/1238548.
> The upstream Pull Request is still open a upstream is reluctant to
> merge it: https://github.com/mesonbuild/meson/pull/6629.
> This issue raise build failures with all meson packages when building
> statically including iputils but also libglib2.

Thanks for info! At least we have working patch.
Good luck with upstreaming.

Kind regards,
Petr
