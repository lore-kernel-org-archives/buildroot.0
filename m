From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 11 Feb 2008 10:23:48 +1100
Subject: [Buildroot] HUGE patch for buildroot
In-Reply-To: <46a136670802091828v558e5d50n131cc9076605bd7c@mail.gmail.com>
References: <46a136670802091828v558e5d50n131cc9076605bd7c@mail.gmail.com>
Message-ID: <20080210232348.GA32402@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 09, 2008 at 09:28:35PM -0500, John Voltz wrote:
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

I think it would help if you can separate it to some extent eg the AVR32
branch separate from X changes separate from the build fixes.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
