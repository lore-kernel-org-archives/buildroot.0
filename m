From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 11:53:53 +0200
Subject: [Buildroot] ARM build fails on 64-bit host (tries linking with
	host libs?)
In-Reply-To: <L163I0$91EE4FE6D33E4ACEA13C654C3E2F6E7E@aruba.it> (Luca
	Ceresoli's message of "Tue, 20 Apr 2010 10:56:24 +0200")
References: <L163I0$91EE4FE6D33E4ACEA13C654C3E2F6E7E@aruba.it>
Message-ID: <87bpdebgb2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <list@lucaceresoli.net> writes:

Hi,

 Luca> But my point in this ml is: why does the compilation of directfb have
 Luca> -L/usr/lib in its commandline?

That seems wrong indeed.

 Luca> Any clues?
 Luca> Anybody else working on 64-bit machines?

Yes, I'm building directfb and Qt here on 64bit (Debian) without any
problems, but with an internal toolchain, rather than CT-NG.

-- 
Bye, Peter Korsgaard
