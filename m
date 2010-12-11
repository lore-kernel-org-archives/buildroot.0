From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 22:45:16 +0100
Subject: [Buildroot] ifplugd
In-Reply-To: <113211291269229@web79.yandex.ru> (=?utf-8?B?ItCh0YLQsNGA0YY=?=
	=?utf-8?B?0LXQsiDQldCy0LPQtdC90LjQuSIncw==?= message of
	"Thu, 02 Dec 2010 08:53:49 +0300")
References: <113211291269229@web79.yandex.ru>
Message-ID: <877hfgnfv7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "???????" == ??????? ??????? <slayer-gurgen@yandex.ru> writes:

 ???????> Hello!
 ???????> When i try to build this package for target system, i get this error (at configuration time).

 ???????> ..
 ???????> checking for strspn... yes
 ???????> checking pkg-config is at least version 0.9.0... yes
 ???????> checking for LIBDAEMON... yes
 ???????> configure: error: missing --with-initdir=DIR
 ???????> ..

 ???????> I think that this is little mistake in related Makefile, but i don't know that means option --with-initdir in this case.

Hmm, looking at the configure script I see this only happens if you
don't have either:

/etc/init.d or /etc/rc.d/init.d

On your build host. What Linux distribution are you using on it?

-- 
Bye, Peter Korsgaard
