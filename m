From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 15:29:28 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 8 Jul 2008
	10\:16\:48 -0300")
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
Message-ID: <87lk0cjyh3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> Strange, what error does it give exactly? I really don't see any
 >> reference to config.sub / config.guess in the openssl package /
 >> tarball.

 Thiago> Hmmm after attempting to build without the CONFIG_UPDATE again, it
 Thiago> seams that it's really not necessary. I guess I might have confused
 Thiago> with another package.

Ahh ok.

 Thiago> It built to avr32 without it, but I also have some clean up changes
 Thiago> laying here, so I will commit both if it's ok.
 Thiago> Basically, this:
 Thiago> http://code.google.com/p/buildroot/source/diff?r=638&format=side&path=/trunk/package/openssl/openssl.mk

I don't get it, how do the files get installed into TARGET_DIR?


-- 
Bye, Peter Korsgaard
