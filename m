From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 14:39:38 +0100
Subject: [Buildroot] Problem when compiling modular xorg for AT91SAM9263
In-Reply-To: <913B398F7060AA40A8CFF5953068F792012F4EAB@lotta.gavle.syntronic.se>
	(Anders Gabert's message of "Tue\, 24 Feb 2009 08\:29\:01 +0100")
References: <913B398F7060AA40A8CFF5953068F792012F4EAB@lotta.gavle.syntronic.se>
Message-ID: <878wnw0x9h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Gabert <anga@Syntronic.se> writes:

 Anders> Hi
 Anders> I have problem installing modular xorg for my AT91SAM9263 board.
 Anders> I get the following error when compiling Mesa, it complains on the -m32 option.
 Anders> Can anyone help me?

Fixed in svn r2439 .. r25443. Notice that you have to enable locale
support in your toolchain to be able to build xorg
(BR2_ENABLE_LOCALE). You'll have to rebuild from scratch after doing that.

-- 
Bye, Peter Korsgaard
