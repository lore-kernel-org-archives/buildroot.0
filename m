From: John Voltz <john.voltz@gmail.com>
Date: Sun, 10 Feb 2008 16:10:49 -0500
Subject: [Buildroot] buildroot Digest, Vol 20, Issue 13
In-Reply-To: <mailman.1.1202673606.14807.buildroot@uclibc.org>
References: <mailman.1.1202673606.14807.buildroot@uclibc.org>
Message-ID: <46a136670802101310r5ea1f7cgab2448bab182d4e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok,, I'm going to iron out some other issues first, then expect my
patch in a few days.

John

On Feb 10, 2008 3:00 PM,  <buildroot-request@uclibc.org> wrote:
> Send buildroot mailing list submissions to
>         buildroot at uclibc.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://busybox.net/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
>         buildroot-request at uclibc.org
>
> You can reach the person managing the list at
>         buildroot-owner at uclibc.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
>
>
> Today's Topics:
>
>    1. HUGE patch for buildroot (John Voltz)
>    2. Re: HUGE patch for buildroot (Ormund Williams)
>    3. Re: HUGE patch for buildroot (Ivan Kuten)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Sat, 9 Feb 2008 21:28:35 -0500
> From: "John Voltz" <john.voltz@gmail.com>
> Subject: [Buildroot] HUGE patch for buildroot
> To: "Buildroot List" <buildroot@uclibc.org>
> Message-ID:
>         <46a136670802091828v558e5d50n131cc9076605bd7c@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hello,
>
> I'm wondering if the buildroot maintainers frequent this list, and if
> so, how do you feel about receiving a humongous patch for it? I've
> been working on bugfixes for well over a week now and I believe it's
> going to be a huge patch. It would take me weeks more to break it into
> individual patches. So far I've fixed a bunch of incorrect package
> install arguments that cause problems with pkgconfig and libtool
> resulting in build failures. I've added the X.org fonts and some other
> missing X.org packages, icu, fltk, webkit, midori, ipkg, updated
> cairo, pango, gtk, and glib to the latest versions. I also merged the
> current branch of the Atmel AVR32 buildroot architecture for that CPU.
> Is there any interest in it, or should I just keep it to myself?
>
> Kind regards,
> John Voltz
>
>
> ------------------------------
>
> Message: 2
> Date: Sat, 09 Feb 2008 22:04:34 -0500
> From: Ormund Williams <ormundw@panix.com>
> Subject: Re: [Buildroot] HUGE patch for buildroot
> To: buildroot at uclibc.org
> Message-ID: <1202612674.3293.8.camel@localhost.localdomain>
> Content-Type: text/plain
>
>
> On Sat, 2008-02-09 at 21:28 -0500, John Voltz wrote:
> > Hello,
> >
> > I'm wondering if the buildroot maintainers frequent this list, and if
> > so, how do you feel about receiving a humongous patch for it? I've
> > been working on bugfixes for well over a week now and I believe it's
> > going to be a huge patch. It would take me weeks more to break it into
> > individual patches. So far I've fixed a bunch of incorrect package
> > install arguments that cause problems with pkgconfig and libtool
> > resulting in build failures. I've added the X.org fonts and some other
> > missing X.org packages, icu, fltk, webkit, midori, ipkg, updated
> > cairo, pango, gtk, and glib to the latest versions. I also merged the
> > current branch of the Atmel AVR32 buildroot architecture for that CPU.
> > Is there any interest in it, or should I just keep it to myself?
> >
> Do NOT keep it to yourself.  If the buildroot maintainers wont accept it
> and you don't have time to break it up into smaller patches, I'll do it.
>
> Thanks for the work.
>
> __
> Ormund
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Sun, 10 Feb 2008 18:49:41 +0200 (EET)
> From: "Ivan Kuten" <ivan.kuten@promwad.com>
> Subject: Re: [Buildroot] HUGE patch for buildroot
> To: "John Voltz" <john.voltz@gmail.com>
> Cc: Buildroot List <buildroot@uclibc.org>
> Message-ID: <45445.127.0.0.1.1202662181.squirrel@localhost>
> Content-Type: text/plain;charset=utf-8
>
> Hi John,
>
> Of course please post your patch. Even if the patch too huge somebody will split it.
>
> Regards,
> Ivan
>
> > Hello,
> >
> > I'm wondering if the buildroot maintainers frequent this list, and if
> > so, how do you feel about receiving a humongous patch for it? I've
> > been working on bugfixes for well over a week now and I believe it's
> > going to be a huge patch. It would take me weeks more to break it into
> > individual patches. So far I've fixed a bunch of incorrect package
> > install arguments that cause problems with pkgconfig and libtool
> > resulting in build failures. I've added the X.org fonts and some other
> > missing X.org packages, icu, fltk, webkit, midori, ipkg, updated
> > cairo, pango, gtk, and glib to the latest versions. I also merged the
> > current branch of the Atmel AVR32 buildroot architecture for that CPU.
> > Is there any interest in it, or should I just keep it to myself?
> >
> > Kind regards,
> > John Voltz
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
>
>
> ------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> End of buildroot Digest, Vol 20, Issue 13
> *****************************************
>
