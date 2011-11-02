From: =?ISO-8859-2?B?o3VrYXN6IFB1s2th?= <lukasz@oxnet.pl>
Date: Wed, 2 Nov 2011 14:17:16 +0100
Subject: [Buildroot] PKG_CONFIG_PATH question
In-Reply-To: <87ehxqlora.fsf@macbook.be.48ers.dk>
References: <CALX2uoNbshTRLzEXYJMOKuKF2WOxks+Q3w5Rz83YXoku3z_ueA@mail.gmail.com>
 <CAAXf6LU3fXXea4e5_kXftPMeLoYz6AuSO75s6OShtYsgnjgE=g@mail.gmail.com>
 <CALX2uoNrcXSLW0LxOomt=sKMPPPZBrxKVBn5pc-rv0xG0QGN2Q@mail.gmail.com>
 <87ehxqlora.fsf@macbook.be.48ers.dk>
Message-ID: <CALX2uoMcg9EpXDUfXekcVBt=UmrWaKE93RYW3+pPhaTWsKfzdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ??ukasz> The error occured when building xcb-proto for the target
> ??ukasz> machine, not host-xcb-proto.
> I guess you mean libxcb?
Yes, I mean libxcb.

> ??ukasz> After some time I found that buildroot generates host-pkg-config
> ??ukasz> package, but I wonder why buildroot uses my host installed pkg-config,
> ??ukasz> what is the reason to build host-pkg-config and use pkg-config from my
> ??ukasz> machine?
>
> Because of a missing dependency. I've fixed it in git now.
Thanks!

Lukasz
