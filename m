From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue, 8 Apr 2008 20:14:47 +0100
Subject: [Buildroot] Hi There
In-Reply-To: <877if8jvjh.fsf@macbook.be.48ers.dk>
References: <200804081340.13053.buildroot.atmel.com@pollet.net>
	<877if8jvjh.fsf@macbook.be.48ers.dk>
Message-ID: <200804082014.47340.buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 08 April 2008, Peter Korsgaard wrote:
> >>>>> "Michel" == Michel (BusError) <buildroot.atmel.com@pollet.net>
> >>>>> writes:
>  Michel> First a question : is there an official git repositiory
>  Michel> somewhere ? I've quickly grown to rely on git, and it would
>  Michel> make things easier for me...
>
> Well, you can always use git-svn like I do.

Good point I'll investigate the git-svn bridge.. It seemd to be getting 
popular...
 
>  Michel> Alternatively, should I push patch emails directly to this
>  Michel> list ? I do try to make them as small as possible.
>
> Yes please, that's the easiest for review.

Ok I'll use git-send-email then :-)

>  Michel> What I have to push right now is :
>  Michel> + NCURSES: Fixed GNU URL pathname for ncurses
>
> Hmm, from a quick look the URL seems correct - Are you uptodate with
> trunk?
It seems that it was fixed in my latest merge this afternoon, so this one no 
longer applies :-)

>  Michel> + SCREEN: Added support for GNU screen
>  Michel> + NCURSES: ncurses install procedure now also copies the
>  Michel> + 'extra' libraries like libpanel.so into the target. This
>  Michel> + allows tools like 'iptraf' to work
>
> Ok, how big is libpanel? Does it make sense to make a specific CONFIG_
> setting for that?

Good point about the size; it's a tiny lib (5KB on avr32)  but I reworked the 
patch to allow to add them selectively via the config file...

>
>  Michel> + IPTRAF: Added support for 'iptraf' curses based traffic monitor
>  Michel> + U-BOOT: A patch to fix the fw_printenv compilation
>  Michel> + U-BOOT: Added support for linux userland environmnet access
>  Michel> + U-BOOT: Documented that the fw_setenv will only work if the
>  Michel> + MTD partition is R/W
>
> Sounds good, looking forward to seeing the patches.

Thanks, I'll post that a bit later..

Michel
