From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 3 Jan 2012 11:48:58 +0100
Subject: [Buildroot] [PATCH] Rework of shutdown policy in inittab
In-Reply-To: <4F02D6E0.7070909@free-electrons.com>
References: <1314966310-4360-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAAXf6LU1QuFL=pOD09e0dzA1ntsauaFSD2qUr-OPEbmXB74fyw@mail.gmail.com>
 <20111214174653.7319339e@skate>
 <CAAXf6LUiEn75JpSsLK4O5_cj8qxgqRhEvNLjQ8sFAB2UjEYeEg@mail.gmail.com>
 <4F02D6E0.7070909@free-electrons.com>
Message-ID: <CAAXf6LV-Q8yg+7gdswavGnXn5sOwywSzi9h-zcbt2pyWNzb-=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 3, 2012 at 11:22 AM, Maxime Ripard <
maxime.ripard@free-electrons.com> wrote:

> On 15/12/2011 09:44, Thomas De Schampheleire wrote:
> > On Wed, Dec 14, 2011 at 5:46 PM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> >> Le Wed, 7 Dec 2011 07:52:20 +0100,
> >> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit
> :
> >>
> >>> I think there are at least two solutions:
> >>> 1. Keep the new behavior created with this patch, but make sure that
> >>> the release notes clearly state this behavior change and update the
> >>> documentation.
> >>
> >> I'd go for this one. All initscripts in Buildroot itself implement the
> >> start/stop/restart logic, so author of scripts that haven't been
> >> submitted upstream should have read this as a suggestion of following a
> >> similar scheme.
> >
> > No problem for me. I also think this is the best alternative.
>
> Then I guess we are all ok for it to be merged ? :)
>

I am, but I'd like to see something added to the documentation, or at least
a mention of this in the CHANGES file.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120103/0d57aa49/attachment.html>
