From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 17:31:07 +0100
Subject: [Buildroot] [PATCH 03/11] support/scripts/pkg-stats: store
 patch info in a hash
In-Reply-To: <20200103172628.4ea87d0e@windsurf>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-4-heiko.thiery@gmail.com>
 <20200103162352.6df5fb35@windsurf>
 <CAEyMn7Zuj3897hZv9cYgmys-Z8h98mbUPeW0L9LJM16Wutofgw@mail.gmail.com>
 <20200103172628.4ea87d0e@windsurf>
Message-ID: <CAEyMn7bPG+eSiTdDNh3Loa=K1qqEOA4C=vQ3DdfvnRGz4A5BgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 3. Jan. 2020 um 17:26 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri, 3 Jan 2020 17:23:20 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > Note: I haven't looked at the other patches in your series yet. Maybe
> > > you add more entries to the dict that make it more relevant.
> >
> > No there are no other entries in this dict.
> > But thinking over that I consider removing the count filed because we
> > can calculate the count from the length of the list of patches?! What
> > do you think?
>
> Yes, also thought about this when reviewing. I also saw we calculate
> this count in a few places, so was not sure if it was that great to
> re-do the count several times. But it's not too many times so indeed,
> perhaps it's easier to keep the patch list around.
>
> But in fact, why do you need the list of patches ? Your web site only
> shows the patch count anyway.

The patches are listed in package detail ... see a the bottom of the page:
http://packages.buildroot.thiery.it/packages/package/android-tools


> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
