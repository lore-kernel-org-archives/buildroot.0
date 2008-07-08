From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 14:39:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 8 Jul 2008
	09\:25\:21 -0300")
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
Message-ID: <87bq18mtwg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago>  Ulf is right. You can try building for avr32 and you will
 Thiago> see that configure fails with unknown platform/compiler
 Thiago> without this. I tried it more or less at the same time as Ulf
 Thiago> commited, while I was porting back some google code
 Thiago> improvements. If Ulf hadn't committed before me, I would
 Thiago> have.

Strange, what error does it give exactly? I really don't see any
reference to config.sub / config.guess in the openssl package /
tarball.

-- 
Bye, Peter Korsgaard
