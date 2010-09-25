From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 25 Sep 2010 16:29:31 +0200
Subject: [Buildroot] "make menuconfig" possibly broken in git master
In-Reply-To: <87mxr66mv9.fsf@macbook.be.48ers.dk>
References: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
	<87mxr66mv9.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=OWG3Q2z2_G4QNU45fFf78391GB2kx5SjUkBLv@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/9/25 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> ?Bj?rn> Hi all,
> ?Bj?rn> My buildroot git master tree fails to "make menuconfig" because of
> ?Bj?rn> "zconf.tab.c:181: error: conflicting types for ?symbol_hash?":
>
> Strange - Could you try the the same with a recent linux kernel
> (E.G. 2.6.36-rc5)?

As the commands "make distclean && make defconfig/menuconfig" fail
I don't know how to specify another kernel version. So I assume you mean
the kernel on build host. I'm on Ubuntu 10.04 and the last time I tried my
own kernel on a Ubuntu system it barely booted. So no, I dare not try a
recent kernel just yet :-)

Best regards,
Bj?rn Forsman
