From: Martin Banky <Martin.Banky@gmail.com>
Date: Sun, 10 Oct 2010 14:50:23 -0700
Subject: [Buildroot] [PATCH 09/10] mplayer: convert to gentargets
In-Reply-To: <1286570702.7489.46.camel@segulix>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-9-git-send-email-Martin.Banky@gmail.com>
	<1286570702.7489.46.camel@segulix>
Message-ID: <AANLkTim9=jciZ2TfJ8SQMFEyeajvPtj-udD0eHp1n1Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 8, 2010 at 1:45 PM, Sergio Monteiro Basto <
sergio@sergiomb.no-ip.org> wrote:

> On Tue, 2010-10-05 at 01:22 -0700, Martin Banky wrote:
> > Would have bumped the version, but someone smarter than me is going to
> > have to
> > do it.
>
> yeh , I will ask why we  don't bumped the version to 1.0-RC3 ?
> is because have a big atmel patch ?
>
> --
> S?rgio M. B.
>

I didn't bump the version to 1.0-RC3, because I couldn't get it to build.
The build routine changed too much from RC2 to RC3. RC2 was released
07-Oct-2007, and RC3 was released 29-May-2010. RC3 was held up for over a
year, before being release, and by mplayer's own admission "...it is
outdated even before the day of its release." Also, RC3 has a lot of fixed
bugs in it, and the mplayer developers _strongly_ suggest using an svn
version. I tried getting an svn version to build, but failed at that. I'm
not well versed enough in their build process, for now anyway, to figure it
out. Like I said, "...someone smarter than me is going to have to do it."

Martin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101010/cc0d9177/attachment.html>
