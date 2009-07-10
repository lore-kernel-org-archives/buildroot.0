From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 10 Jul 2009 23:05:40 +0200
Subject: [Buildroot] VLC media player patched + some libraries added
In-Reply-To: <87a5b0800907100326m537a6e0exdf355d217eaa308@mail.gmail.com>
References: <1247218265.6260.12.camel@ess-roelvp>
	<87a5b0800907100326m537a6e0exdf355d217eaa308@mail.gmail.com>
Message-ID: <200907102305.40933.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Newton, 10.07.2009:
> On Fri, Jul 10, 2009 at 10:31 AM, Roeland Van Praet<roelvp@mind.be> wrote:
> > Hi all,
> >
> > In March I already submitted this patch but apparantly it hasn't been
> > accepted yet, even after a reminder.
> > Can someone please review this patch and tell me if it is missing something
> > or not.
> >
> > Thank you very much,
> 
> It would be helpful to submit this patch as a number of entries in the
> bugzilla, one per package

Personally I find working with the bug tracker extremely annoying. I
only look at those patches, if they are of direct interest to me.

> - that way if things do get missed on the
> mailing list then someone is more likely to pick them up later.

I'm not totally sure about that. Resending as it's done in several other
projects as well, should raise more attention.

But it's right, you should send one patch for one package. And inline in
the mail. It would also be more attractive for review.

> I notice VLC 1.0.0 is out. Is there a reason why you are using an older version?

True. It also seems that vlc.patch is already applied in a somewhat
different form, which makes VLC work with older libavcodec versions as
well.

> Also it appears that the version of ffmpeg is a snapshot which changes
> daily. Is that the case? It would seem useful to have an option to
> pick a particular snapshot so builds are more reproducible.

It's also possible to use snapshots from Gentoo for example:
http://distfiles.gentoo.org/distfiles/ffmpeg-0.5.tar.bz2

Have you sent your changes in ffmpeg.patch upstream? Patches in
Buildroot normally only make sense for bug fixes, not for improvements.

Markus
