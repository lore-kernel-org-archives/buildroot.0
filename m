From: Ormund Williams <ormundw@panix.com>
Date: Sat, 09 Feb 2008 22:04:34 -0500
Subject: [Buildroot] HUGE patch for buildroot
In-Reply-To: <46a136670802091828v558e5d50n131cc9076605bd7c@mail.gmail.com>
References: <46a136670802091828v558e5d50n131cc9076605bd7c@mail.gmail.com>
Message-ID: <1202612674.3293.8.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sat, 2008-02-09 at 21:28 -0500, John Voltz wrote:
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
Do NOT keep it to yourself.  If the buildroot maintainers wont accept it
and you don't have time to break it up into smaller patches, I'll do it.

Thanks for the work.

__
Ormund
