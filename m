From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 22:59:23 +0200
Subject: [Buildroot] [git commit branch/next] gcc: remove
	BR2_GCC_ENABLE_TLS option
In-Reply-To: <20160831194551.2BE4280131@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 31 Aug 2016 21:45:36 +0200")
References: <20160831194551.2BE4280131@busybox.osuosl.org>
Message-ID: <874m60zmc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > So, this commit completely removes the BR2_GCC_ENABLE_TLS and instead
 > makes the right choice inside gcc.mk directly:

 >  - TLS support enabled for glibc, musl and uClibc/NPTL

 >  - TLS support in other cases, i.e uClibc/no-thread and
 >    uClibc/linuxthreads.

Ups, looks like 2nd variant should have been 'No TLS support'.

-- 
Bye, Peter Korsgaard
