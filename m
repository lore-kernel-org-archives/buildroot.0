From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Jan 2011 23:45:47 +0100
Subject: [Buildroot] [PATCH 3/6] gdb: make it a proper package
In-Reply-To: <87hbdrc6ar.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Sun, 02 Jan 2011 23:03:08 +0100")
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
	<1293795546-19674-6-git-send-email-gustavo@zacarias.com.ar>
	<87hbdrc6ar.fsf@macbook.be.48ers.dk>
Message-ID: <87aajidiw4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Gustavo> TODO: copy gdbserver from external toolchains

 Peter> Hmm, I don't quite like this Config.in.{internal,external} stuff, I'll
 Peter> take a look and see if I can combine them.

We can do something like this below, but I also now noticed that you can
no longer build both gdbserver and full gdb, like we used to be able to
do. The gdb build system seems a bit odd, so I don't see any nice way of
building both in the same make step.

Any ideas?
