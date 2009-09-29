From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Sep 2009 23:09:18 +0200
Subject: [Buildroot] problems building git head
In-Reply-To: <c166aa9f0909291340j54ae2835o233fad9d89fdf96b@mail.gmail.com>
	(Andrew Dyer's message of "Tue\, 29 Sep 2009 15\:40\:50 -0500")
References: <c166aa9f0909291340j54ae2835o233fad9d89fdf96b@mail.gmail.com>
Message-ID: <87fxa5pif5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Dyer <amdyer@gmail.com> writes:

 Andrew> Hi - I'm attempting to build buildroot on a debian based system and
 Andrew> having problems.  Problem occured both on 2009.08 and on git head.
 Andrew> I configured buildroot for generic ARM, EABI, and ramdisk via 'make
 Andrew> menuconfig' and saved the config file. When I do 'make', I get:

 Andrew> package/multimedia/libvorbis/libvorbis.mk:20: *** missing `endif'.  Stop.

No, I haven't seen that (I use Debian as well). Please post your .config
so I can try to reproduce it.

-- 
Bye, Peter Korsgaard
