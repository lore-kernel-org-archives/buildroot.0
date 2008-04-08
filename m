From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2008 16:00:50 +0200
Subject: [Buildroot] Hi There
In-Reply-To: <200804081340.13053.buildroot.atmel.com@pollet.net> (Michel's
	message of "Tue\, 8 Apr 2008 13\:40\:13 +0100")
References: <200804081340.13053.buildroot.atmel.com@pollet.net>
Message-ID: <877if8jvjh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel (BusError) <buildroot.atmel.com@pollet.net> writes:

 Michel> I've been using buildroot via atmel's AVR32 git tree for some
 Michel> time, and I started to fix problems. It's been suggested that
 Michel> I push my 'general' patches to you guys so they will come
 Michel> back down the feeding chain to us :-)

Sounds good!

 Michel> First a question : is there an official git repositiory
 Michel> somewhere ? I've quickly grown to rely on git, and it would
 Michel> make things easier for me...

Well, you can always use git-svn like I do.

 Michel> Alternatively, should I push patch emails directly to this
 Michel> list ? I do try to make them as small as possible.

Yes please, that's the easiest for review.

 Michel> What I have to push right now is :
 Michel> + NCURSES: Fixed GNU URL pathname for ncurses

Hmm, from a quick look the URL seems correct - Are you uptodate with
trunk?

 Michel> + SCREEN: Added support for GNU screen
 Michel> + NCURSES: ncurses install procedure now also copies the
 Michel> + 'extra' libraries like libpanel.so into the target. This
 Michel> + allows tools like 'iptraf' to work

Ok, how big is libpanel? Does it make sense to make a specific CONFIG_
setting for that?

 Michel> + IPTRAF: Added support for 'iptraf' curses based traffic monitor
 Michel> + U-BOOT: A patch to fix the fw_printenv compilation
 Michel> + U-BOOT: Added support for linux userland environmnet access
 Michel> + U-BOOT: Documented that the fw_setenv will only work if the
 Michel> + MTD partition is R/W

Sounds good, looking forward to seeing the patches.

-- 
Bye, Peter Korsgaard
