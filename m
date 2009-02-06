From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 09:52:03 +0100
Subject: [Buildroot] uClibc-0.9.30-avr32-2.1.5.tar.bz2 is missing
In-Reply-To: <d6cda7730902041425g5aab0fc3q44c25f2af088ae35@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 4 Feb 2009
	20\:25\:03 -0200")
References: <d6cda7730902041111h26b28bc7l4ab8f2fff3ef9e1c@mail.gmail.com>
	<F5677F2913BF4E44A9D6D3B4D74FB21C@aeglos>
	<d6cda7730902041425g5aab0fc3q44c25f2af088ae35@mail.gmail.com>
Message-ID: <87skms9ccs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> It's not necessary, after a number of failed attempts, it does try the
 Thiago> buildroot mirror, but it's not there as well.
 Thiago> Could you upload to buildroot mirror or sourceforge so someone could
 Thiago> move it to buildroot mirror?

No, I have populated the buildroot mirror with make allyesconfig; make
source which uses the default arch (i386), so arch specific stuff
doesn't get included.

What should I do to get this Atmel stuff?

-- 
Bye, Peter Korsgaard
