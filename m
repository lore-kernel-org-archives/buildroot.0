From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 23 Sep 2019 08:36:59 -0500
Subject: [Buildroot] [External] Re: [PATCH 09/30] package/musl-fts: new
 package
In-Reply-To: <20190923153337.1e4a2ed0@windsurf>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
 <CANQCQpbDfgRAvwf1caXcRJV5k1Mi=NeRyiUaE9RS-hCOQ9UWEg@mail.gmail.com>
 <20190923153337.1e4a2ed0@windsurf>
Message-ID: <CANQCQpY8Y11Xafg5abz+GbkEYQycXxwTtt2GCoz+=gRPq5GWrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Sep 23, 2019 at 8:33 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 23 Sep 2019 08:12:17 -0500
> Matthew Weber <matthew.weber@collins.com> wrote:
>
> > > +MUSL_FTS_VERSION = v1.2.7
> >
> > Does it make sense in this case to move the "v" to the SITE like the
> > other version fix-ups?  I checked release monitoring and it doesn't
> > look like there is an entry yet for this package (ie. no precedence
> > has been set yet)
>
> It makes complete sense to move the "v" to the site of course. My bad,
> this patch was sitting in a Buildroot branch for quite a while, and I
> didn't rework it after the "v" cleanup in all other Buildroot packages.
>
> I'll wait for other comments before sending a v2 (which would be
> another 22 patches sent on the mailing list), unless someone applies my
> patch and does the fix.
>

I probably won't send a Reviewed by for the other patches individually
but I did go through them and it looks good.  (Had a few side
conversations on the host selinux dependency removal for
policycoreutils and it seems fine)

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
