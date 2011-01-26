From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 12:35:28 +0100
Subject: [Buildroot] Problem compiling busybox with libpam
In-Reply-To: <AANLkTi=SoMmj4_=FMZnJ3cYTyJcTj2ymizEOM9PGSO3r@mail.gmail.com>
	(Spider's message of "Tue, 25 Jan 2011 22:02:54 -0200")
References: <AANLkTi=SoMmj4_=FMZnJ3cYTyJcTj2ymizEOM9PGSO3r@mail.gmail.com>
Message-ID: <87bp33vqwv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spider" == Spider  <spiderwebmail@gmail.com> writes:

Hi,

 Spider> I was using buildroot to compile busybox and got the following error
 Spider> when I add libpam to "make busybox-menuconfig".  (The output is
 Spider> below).
 Spider> How can I get libpam to compile without this errors? If I "make clean"
 Spider> and remake everything from scratch will it work? (I am avoiding this
 Spider> because of the time to compile and fear of configuration changes)

 Spider> I searched for a similar problem but didnt find anything on
 Spider> documentation.

There's no pam support in uClibc/buildroot, so this can only work if you
use an external glibc toolchain with pam support.

Please follow up on the buildroot list rather than here on busybox.

-- 
Bye, Peter Korsgaard
