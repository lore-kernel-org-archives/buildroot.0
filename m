From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 21:38:55 +0200
Subject: [Buildroot] problem compiling lighttpd (pcre problem)
In-Reply-To: <ea6597e70807241051y2aeb1c8bt65a841c29c1d5b08@mail.gmail.com>
	(Richard's message of "Thu\, 24 Jul 2008 18\:51\:07 +0100")
References: <ea6597e70807241051y2aeb1c8bt65a841c29c1d5b08@mail.gmail.com>
Message-ID: <87ej4oiwc0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard  <mr.resistor@gmail.com> writes:

 Richard> hey
 Richard> i have finally got everything i want to compile, except for
 Richard> lighttpd.  the error message given is :

 Richard>  skipping incompatible /usr/lib/libpcre.so when searching
 Richard> for -lpcre
 Richard> /dns323/uclibc/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/bin/ld:
 Richard> cannot find -lpcre

That's an error in libpcre, not lighttpd when compiling without C++
support. It should be fixed in trunk now.

-- 
Bye, Peter Korsgaard
