From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 22:16:04 +0100
Subject: [Buildroot] [External] Re: [PATCH v5]
 support/scripts/pkg-stats: add latest upstream version information
In-Reply-To: <CA+fik51_toDs8PPL6wk8OZDNVTAkBb5a5CkuaPzk6JjnPDvzyQ@mail.gmail.com>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
 <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
 <20190103213316.637c464b@windsurf>
 <CA+fik51_toDs8PPL6wk8OZDNVTAkBb5a5CkuaPzk6JjnPDvzyQ@mail.gmail.com>
Message-ID: <20190103221604.4da001d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Jan 2019 15:02:24 -0600, Brandon Maier wrote:

> Agreed it's not a pretty hack. I wouldn't want to handle the other
> oddities in here, as that would get messy. I suggested it for "v" only
> because it seems to be very common. It would be a way to get us most
> of the way there, then it could be reverted if e.g. all the github
> versions are fixed up.
> 
> On those other packages though, perhaps adding an optional variable to
> package mk files for custom versions? E.g. package/libnfs/libnfs.mk
> defines version as "libnfs-3.0.0", but the r-m version is "3.0.0".
> E.g.
> 
> package/libnfs/libnfs.mk:
>   LIBNFS_RM_VERSION = 3.0.0
>   LIBNFS_VERSION = libnfs-$(LIBNFS_RM_VERSION)

We could do that, but is that really needed/useful ?

> > It seems like I never posted them. I thought there was some discussion
> > on the list about this issue, but I can't find it. Perhaps I should
> > update this series, submit it for good, and see what the feedback is ?  
> 
> Regardless of this patch series, this sounds like a good idea to me.
> Especially considering Anitya does this too, as Yann mentioned[1].
> 
> [1] https://github.com/release-monitoring/anitya/issues/374

Right. So you say I should submit this "fix-versions" patch series ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
