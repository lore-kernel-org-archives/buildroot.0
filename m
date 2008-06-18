From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 17:48:38 +0200
Subject: [Buildroot] [PATCH] Fix nbd compile
In-Reply-To: <d6cda7730806180829h4e81ea16tec105d2bf87ef5a0@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 18 Jun 2008
	12\:29\:17 -0300")
References: <d6cda7730806180745s329ee330of0fdfaf7fb7a8397@mail.gmail.com>
	<87ej6u2317.fsf@macbook.be.48ers.dk> <20080618151636.GA2172@mx.loc>
	<d6cda7730806180829h4e81ea16tec105d2bf87ef5a0@mail.gmail.com>
Message-ID: <87d4mezquh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Or libraries could provide a variable that we could use on depends.
 Thiago> At least this way, packages won't be broken if we decide to revamp
 Thiago> some library makefile.

That would only work if we would be careful to let make parse the
library .mk files before applications - And we would also need to get
the order correct for libraries using other libraries.

-- 
Bye, Peter Korsgaard
