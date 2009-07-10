From: Will Newton <will.newton@gmail.com>
Date: Fri, 10 Jul 2009 11:26:45 +0100
Subject: [Buildroot] VLC media player patched + some libraries added
In-Reply-To: <1247218265.6260.12.camel@ess-roelvp>
References: <1247218265.6260.12.camel@ess-roelvp>
Message-ID: <87a5b0800907100326m537a6e0exdf355d217eaa308@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 10, 2009 at 10:31 AM, Roeland Van Praet<roelvp@mind.be> wrote:
> Hi all,
>
> In March I already submitted this patch but apparantly it hasn't been
> accepted yet, even after a reminder.
> Can someone please review this patch and tell me if it is missing something
> or not.
>
> Thank you very much,

It would be helpful to submit this patch as a number of entries in the
bugzilla, one per package - that way if things do get missed on the
mailing list then someone is more likely to pick them up later.

I notice VLC 1.0.0 is out. Is there a reason why you are using an older version?

Also it appears that the version of ffmpeg is a snapshot which changes
daily. Is that the case? It would seem useful to have an option to
pick a particular snapshot so builds are more reproducible.
