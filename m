From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Dec 2009 18:53:46 +0100
Subject: [Buildroot] develop using buildroot
In-Reply-To: <200912201506.20584.korgull@home.nl> (Marcel's message of "Sun,
	20 Dec 2009 15:06:20 +0100")
References: <200912201506.20584.korgull@home.nl>
Message-ID: <87skb51qhh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcel" == Marcel  <korgull@home.nl> writes:

 Marcel> Hi,
 Marcel> I'm having some issues setting up a workable environment.
 Marcel> I need to write my own kernel drivers, add some packages and change u-boot.

 Marcel> buildroot requires patches, so that's clear but I wonder how to
 Marcel> efficiently develop those patches.

 Marcel> Do I set up the kernel and u-boot outside buildroot, than
 Marcel> create patches form there and than include those in buildroot ?

Didn't you ask the same question just a few days ago? You can work in
whatever way suits you best, but personally I prefer to get kernel+uboot
up and running outside buildroot, and then just add the patches to BR
once everything is working.

-- 
Bye, Peter Korsgaard
