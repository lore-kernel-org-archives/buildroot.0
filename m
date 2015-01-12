From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Jan 2015 23:15:30 +0100
Subject: [Buildroot] [PATCH v2 1/4] dtc: fix project and download url
In-Reply-To: <20150112213937.4af8de78@free-electrons.com>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>,
 <20150112213937.4af8de78@free-electrons.com>
Message-ID: <trinity-5c03b9e1-2fa7-4998-badc-63c29e1ee455-1421100930124@3capp-gmx-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Montag, 12. Januar 2015 um 21:39 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v2 1/4] dtc: fix project and download url
>
> Dear Peter Seiderer,
> 
> On Sun, 11 Jan 2015 19:16:03 +0100, Peter Seiderer wrote:
> > and rename patches to new convention
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/dtc/0001-separate-lib-install.patch | 28 +++++++++++++++++++++++++
> >  package/dtc/0002-extra-cflags.patch         | 32 +++++++++++++++++++++++++++++
> >  package/dtc/Config.in                       |  2 +-
> >  package/dtc/dtc-extra_cflags.patch          | 32 -----------------------------
> >  package/dtc/dtc-separate-lib-install.patch  | 28 -------------------------
> >  package/dtc/dtc.mk                          |  5 +++--
> >  6 files changed, 64 insertions(+), 63 deletions(-)
> >  create mode 100644 package/dtc/0001-separate-lib-install.patch
> >  create mode 100644 package/dtc/0002-extra-cflags.patch
> >  delete mode 100644 package/dtc/dtc-extra_cflags.patch
> >  delete mode 100644 package/dtc/dtc-separate-lib-install.patch
> 
> Thanks. I was going to apply this, but since PATCH 2 has some issues,
> I'll give some minor comments on this one as well:
> 
>  1/ You're doing two separate things here: change the project URL, and
>     rename the patches. So this should be done in two separate patches.
> 

O.k.

>  2/ Please enable rename detection in Git, so we can clearly see in the
>     patch that it's a rename.
>

O.k.
 
> Can you resend with this fixed?
>

Will do....

Regards,
Peter
 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
