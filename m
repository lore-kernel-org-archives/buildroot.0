From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 9 May 2020 23:29:22 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/fakeroot: bump version to
 1.24
In-Reply-To: <20200509185010.25c376ea@windsurf.home>
References: <20200506131130.410171-1-nolange79@gmail.com>
 <20200506131130.410171-2-nolange79@gmail.com>
 <20200509185010.25c376ea@windsurf.home>
Message-ID: <CADYdroP1VRGH5DcZMgO5ON_JK8+UVMHMyS6JpAJxdPyUJZ=BmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sa., 9. Mai 2020 um 18:50 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Wed,  6 May 2020 15:11:29 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  ...02-Select-TCP-when-lack-of-SYSV-IPC.patch} |  0
> >  ...nicate-check-return-status-of-msgrcv.patch | 46 -------------------
> >  package/fakeroot/fakeroot.hash                |  6 +--
> >  package/fakeroot/fakeroot.mk                  |  6 +--
> >  4 files changed, 5 insertions(+), 53 deletions(-)
> >  rename package/fakeroot/{0003-Select-TCP-when-lack-of-SYSV-IPC.patch => 0002-Select-TCP-when-lack-of-SYSV-IPC.patch} (100%)
> >  delete mode 100644 package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
>
> What happened to 0002-communicate-check-return-status-of-msgrcv.patch ?
> It is removed by your patch. Why?

Cause its included in that version

>
> Also, your PATCH 1/2 is a version bump, but PATCH 2/2 is a bug fix.
> Since Buildroot 2020.05-rc1 has now been released, we normally don't
> merge version bumps in master.
>
> Could you clarify if the fchownat/fchmodat issue happens with the
> current version of fakeroot in Buildroot (1.20) ? Or only with the
> updated version 1.24 ? Can it be fixed with fakeroot 1.20 ?

issue exist with both, could certainly be fixed in 1.20 separately,
I just don't take much interest in fixing ~ 4 year versions by default.

Norbert
