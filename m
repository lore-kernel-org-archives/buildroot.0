From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Aug 2008 21:01:10 +0200
Subject: [Buildroot] Package haserl does not install to root filesystem
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190960E889@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Thu\,
	7 Aug 2008 22\:11\:42 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190960E889@mi8nycmail19.Mi8.com>
Message-ID: <873al8rb7t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

 hartleys> Hello all,

 hartleys> I have the haserl package selected (due to webif) but it
 hartleys> does not get installed when I do a make.

 hartleys> After the initial make is complete and the root filesystem
 hartleys> exists in my $(TARGET_DIR) I can do the following to get it
 hartleys> to install:

 hartleys> $ make haserl-dirclean
 hartleys> $ make

 hartleys> Any ideas how to fix it?

Could you be a bit more specific? Does it error out or does the haserl
install step never run? It seems to work here.

 hartleys> Also, I'm not sure it matters but, the haserl.mk looks
 hartleys> different than most the other .mk that use AUTOTARGETS. It
 hartleys> uses := instead of = to set all the variables.

That's afaik ok. := is more efficient than = so it should normally be
used.

-- 
Bye, Peter Korsgaard
