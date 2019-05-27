From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 May 2019 12:52:06 -0600
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump to version
 0b8feb80fdef9a415d8250bca1790b3ff23e8391
In-Reply-To: <20190526213318.3e54c484@windsurf>
References: <20190524203541.116482-1-james.hilliard1@gmail.com>
 <20190524231309.4c7a4ec1@windsurf>
 <CADvTj4oqmLMOdaj_5Ou_16Bh1goS+5YBnP_Eopuet7-LuskysQ@mail.gmail.com>
 <20190524232410.62e28210@windsurf>
 <CADvTj4rh8At+7G-nt0uO1VSyYqkLt35npGi1smWrYOJ296XwDw@mail.gmail.com>
 <20190526213318.3e54c484@windsurf>
Message-ID: <CADvTj4qM8t1ThUKFD5e0zPzSF4YztjVqx4LUZSYS5BpHyzRnGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 26, 2019 at 1:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Fri, 24 May 2019 15:40:33 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > Could you comment on what are the other commits between v0.12.1 and
> > > 0b8feb80fdef9a415d8250bca1790b3ff23e8391 ? Only bug fixes, and we
> > > should take all of them to master ? Or should we just backport the
> > > Linux 5.1 fix ?
> > Other than a readme change there are no commits between v0.12.1 and
> > 0b8feb80fdef9a415d8250bca1790b3ff23e8391.
>
> I think in this case, it makes more sense to just "backport" the single
> patch that fixes this issue, and put it in package/v4l2loopback/. Could
> you send an updated version of your patch with this solution instead ?
Upstream tagged v0.12.2 so I've changed my patch to update to that instead.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
