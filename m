From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Feb 2012 09:09:27 +0100
Subject: [Buildroot] BR 2012.02-rc1 :: WODIM issue (linking stage) [
	SOLVED ]
In-Reply-To: <CAPEB33xJ_2_y40Kiw8OJ5=Wbz3SziQzeeAX=Hw4XjAZKKSkZTQ@mail.gmail.com>
 (MERCADIER Johann's message of "Wed, 22 Feb 2012 20:16:25 +0000")
References: <CAPEB33xJ_2_y40Kiw8OJ5=Wbz3SziQzeeAX=Hw4XjAZKKSkZTQ@mail.gmail.com>
Message-ID: <87obsmyq14.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "MERCADIER" == MERCADIER Johann <johann.mercadier@imerir.com> writes:

 MERCADIER> Hi Sam,
 MERCADIER> ??thanks for your guess, I finally get through of it!
 MERCADIER> ??My host-system needed to add "libbz2-dev" in its /usr/include
 MERCADIER> ?? Just have to check if everything works fine by now!

This problem was caused by a bug in our new
automatic-derrive-host-package-dependencies handling for packages using
cmake. I've fixed it now in git and it will be included in -rc3.

-- 
Bye, Peter Korsgaard
