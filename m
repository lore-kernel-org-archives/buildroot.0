From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 19:27:54 +0100
Subject: [Buildroot] ucilbc 0.9.33.2 fails to build on buildroot 2013.11
	internal toolchain
In-Reply-To: <5297837C.3@mail.ru> (Alexander Varnin's message of "Thu, 28 Nov
 2013 21:55:08 +0400")
References: <5297837C.3@mail.ru>
Message-ID: <878uw8z8id.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Varnin <fenixk19@mail.ru> writes:

 > Building uclibc with default config now fails for me, after upgrading to
 > latest buildroot (now from 2013.11-rc3 branch).Attaching my config.
 > Build system is Debian Wheezy.

 > Here is short output of make command:

 > varnin at debian5 ~/minipos-OS-build-2013.11> make
 > make -C /home/varnin/buildroot O=/home/varnin/minipos-OS-build-2013.11/.

So an out-of-tree build.

 >>>> uclibc 0.9.33.2 Building

That's not the first target to run with a clean build. Did you forget to
clean your output directory?

What is your .config?

-- 
Bye, Peter Korsgaard
