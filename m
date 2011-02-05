From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Feb 2011 21:04:51 +0100
Subject: [Buildroot] make source cannot find /gcc-/gcc-.tar.bz2
In-Reply-To: <AANLkTinNDuEZiQfV8pEyKg8SsdNSNKj7Q4k-mFJtN8B1@mail.gmail.com>
	(Friedrich Schick's message of "Sat, 5 Feb 2011 18:39:24 +0100")
References: <AANLkTinNDuEZiQfV8pEyKg8SsdNSNKj7Q4k-mFJtN8B1@mail.gmail.com>
Message-ID: <87lj1up7rw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Friedrich" == Friedrich Schick <Friedrich.Schick@web.de> writes:

 Friedrich> Hello,

 Friedrich> I like to build buildroot for a PPC 405 without FPU using a
 Friedrich> external toolchain with glibc support.

 Friedrich> When I do "make source" it seems, that the Makefile is
 Friedrich> looking for "not configured" GCC version. Where do I setup
 Friedrich> this version?

That's a known issue in 2010.11. It's fixed in git:

http://bugs.buildroot.net/2893

As a workaround you can do make -k source

-- 
Bye, Peter Korsgaard
