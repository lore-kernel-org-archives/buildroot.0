From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 07:24:40 +0100
Subject: [Buildroot] Need some help with uClibc build
In-Reply-To: <49768405.20909@hq.tensilica.com> (Maxim Grigoriev's message of
	"Tue\, 20 Jan 2009 18\:10\:13 -0800")
References: <49768405.20909@hq.tensilica.com>
Message-ID: <87zlhltbvb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Grigoriev <maxim@tensilica.com> writes:

 Maxim> Can somebody, please, help me.
 Maxim> I seem to be missing something trivial like the fact that
 Maxim> gcc-4.3.1+ would not work with uClibc-0.9.29, or something
 Maxim> like this.

That could very well be - uClibc 0.9.29 is old, and gcc 4.3.x is
pretty new.

 Maxim> I'm trying to build buildroot with

 Maxim>     binutils-2.19
 Maxim>     uClibc-0.9.29
 Maxim>     gcc-4.3.1

Why would you want to use those versions instead of the stable and
recommended ones? (uclibc 0.9.30, gcc 4.3.2)?

-- 
Bye, Peter Korsgaard
