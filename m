From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 8 Jul 2008 10:16:48 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <87bq18mtwg.fsf@macbook.be.48ers.dk>
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 8, 2008 at 9:39 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>  Thiago>  Ulf is right. You can try building for avr32 and you will
>  Thiago> see that configure fails with unknown platform/compiler
>  Thiago> without this. I tried it more or less at the same time as Ulf
>  Thiago> commited, while I was porting back some google code
>  Thiago> improvements. If Ulf hadn't committed before me, I would
>  Thiago> have.
>
> Strange, what error does it give exactly? I really don't see any
> reference to config.sub / config.guess in the openssl package /
> tarball.

Hmmm after attempting to build without the CONFIG_UPDATE again, it
seams that it's really not necessary. I guess I might have confused
with another package.
It built to avr32 without it, but I also have some clean up changes
laying here, so I will commit both if it's ok.
Basically, this:
http://code.google.com/p/buildroot/source/diff?r=638&format=side&path=/trunk/package/openssl/openssl.mk

Regards,
   Thiago A. Correa
