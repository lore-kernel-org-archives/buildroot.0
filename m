From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 09:52:10 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232523725.11888.11.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 08\:42\:05 +0100")
References: <1232523725.11888.11.camel@elrond.atmel.com>
Message-ID: <87vds9t51h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
 Ulf> wchar, largefile,ipv6, NWFPE

Thanks, but why? Please use the default versions as that's what we're
releasing with and what new users will use.

E.G. binutils 2.29, uclibc 0.9.30, gcc 4.3.2

Could you rerun it with proper toolchain settings? Thanks.

-- 
Bye, Peter Korsgaard
