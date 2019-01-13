From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Jan 2019 16:42:26 -0700
Subject: [Buildroot] [PATCH 1/1] package/zbar: switch to linuxtv zbar
 fork
In-Reply-To: <20190113143504.0fd22fe4@windsurf.home>
References: <1547380110-7761-1-git-send-email-james.hilliard1@gmail.com>
 <20190113143504.0fd22fe4@windsurf.home>
Message-ID: <CADvTj4oSduWtD2xyaDYG+qLMjyxWBuAQO8b7J9UpEmT3ahz-+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 13, 2019 at 6:35 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 13 Jan 2019 19:48:30 +0800, james.hilliard1 at gmail.com wrote:
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > The zbar upstream previously used has been abandoned since 2012.
> > The linuxtv fork appears to be the most actively maintained fork.
> > I've resynced patches that wouldn't apply and added a few minor bug fixes.
>
> Please try to not use first person sentences in commit log. Also, it
> would be good to explain why the current patch 0004 is removed.
Will mention that it was merged into upstream in v2.
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  ...onf-by-reducing-the-warning-error-checkin.patch | 16 ++---
> >  ...p-logical-not-operations-into-parentheses.patch | 80 ----------------------
> >  ...eo-buffers-after-probing-and-request-them.patch | 51 ++++++++++++++
> >  ...-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch | 26 +++++++
>
> These patches are not just trivial build fixes. I'd like to see them be
> submitted upstream. I suggest that you send them to Mauro + the
> linux-media kernel mailing list in Cc, with some patch prefix such as
> [PATCH zbar] so that it is clear to what project they apply.
Sent series to mauro and linux-media
https://www.mail-archive.com/linux-media at vger.kernel.org/msg142987.html.
I added all of our local patches as well(with the disable docs patch
tweaked to be a configure flag).
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
