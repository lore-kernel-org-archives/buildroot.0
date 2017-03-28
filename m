From: Pawel Sikora <sikor6@gmail.com>
Date: Tue, 28 Mar 2017 20:01:51 +0200
Subject: [Buildroot] [PATCH 1/2] xenomai: bump version to 3.0.3
In-Reply-To: <20170326100547.2ce52b7d@free-electrons.com>
References: <20170321165137.23527-1-sikor6@gmail.com>
 <20170321165137.23527-2-sikor6@gmail.com>
 <20170326100547.2ce52b7d@free-electrons.com>
Message-ID: <CAKfV1CbiC0oF5L3nUvmLohg1Q+APMETbQJKQemjBnF7bRy1smA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


> On Tue, 21 Mar 2017 17:51:37 +0100, Pawel Sikora wrote:
> > Bump Xenomai version to 3.0.3,
> > Remove patch 0001-bfin-remove-inline-keyword.patch for version 2.6.4,
> > as it is already included in upstream
> >
> > Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> > ---
> >  .../xenomai/0001-bfin-remove-inline-keyword.patch  | 62
> ----------------------
> >  package/xenomai/xenomai.hash                       |  2 +-
> >  package/xenomai/xenomai.mk                         |  2 +-
> >  3 files changed, 2 insertions(+), 64 deletions(-)
> >  delete mode 100644 package/xenomai/0001-bfin-
> remove-inline-keyword.patch
>
> This wasn't building properly with gcc 6.x, so I've added a patch to
> fix this, and then applied.
>
> At some point, it would be nice to support the "Mercury" variant of
> Xenomai 3, but that can be done through additional patches.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>


Ok, thanks ;-)

I am thinking right now about some good solution about configs regarding
choosing
Xenomai core. I will present a patch when it is ready and invite you for
the discussion ;-)

Kind Regards,
Pawel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170328/69de4548/attachment.html>
