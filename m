From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 3 Jan 2019 17:29:19 -0600
Subject: [Buildroot] [External] Re: [PATCH v5]
 support/scripts/pkg-stats: add latest upstream version information
In-Reply-To: <20190103221604.4da001d1@windsurf>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
 <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
 <20190103213316.637c464b@windsurf>
 <CA+fik51_toDs8PPL6wk8OZDNVTAkBb5a5CkuaPzk6JjnPDvzyQ@mail.gmail.com>
 <20190103221604.4da001d1@windsurf>
Message-ID: <CA+fik51QgEX7WEuanOPiDoqMDsqOAiLe4GC5yvVE2JPzVRikqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 3, 2019 at 3:31 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
...
> > package/libnfs/libnfs.mk:
> >   LIBNFS_RM_VERSION = 3.0.0
> >   LIBNFS_VERSION = libnfs-$(LIBNFS_RM_VERSION)
>
> We could do that, but is that really needed/useful ?
>

As discussed on IRC, nevermind this. If all package's _VERSION are
changed to match release-monitoring then it won't matter.

> > > It seems like I never posted them. I thought there was some discussion
> > > on the list about this issue, but I can't find it. Perhaps I should
> > > update this series, submit it for good, and see what the feedback is ?
> >
> > Regardless of this patch series, this sounds like a good idea to me.
> > Especially considering Anitya does this too, as Yann mentioned[1].
> >
> > [1] https://github.com/release-monitoring/anitya/issues/374
>
> Right. So you say I should submit this "fix-versions" patch series ?

Yes, good to get the discussion going.
