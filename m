From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 17:02:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <d6cda7730807080756qb660dd7k19a618ce9d90ad7b@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 8 Jul 2008
	11\:56\:10 -0300")
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	<87lk0cjyh3.fsf@macbook.be.48ers.dk>
	<d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
	<87vdzgh4ko.fsf@macbook.be.48ers.dk>
	<d6cda7730807080756qb660dd7k19a618ce9d90ad7b@mail.gmail.com>
Message-ID: <87prpobeqx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> It will install to /usr/bin c_rehash  fipsld  openssl and
 Thiago> headers/libs, which the current make file does in:

Ok, does it also strip them?

 Thiago> If I'm not mistaken, the headers and static libs are usually
 Thiago> removed later on when packing the final image, right?

Yes, unless the HAVE_DEVFILES stuff is enabled.

-- 
Bye, Peter Korsgaard
