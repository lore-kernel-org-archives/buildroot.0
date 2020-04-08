From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 8 Apr 2020 23:15:41 +0200
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.0.1
In-Reply-To: <20200408224700.76701687@gmx.net>
References: <20200407211238.11904-1-ps.report@gmx.net>
 <20200408213140.0a4f6706@windsurf.home>
 <20200408224700.76701687@gmx.net>
Message-ID: <20200408231541.6319760f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 8 Apr 2020 22:47:00 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Thomas,
>
> On Wed, 8 Apr 2020 21:31:40 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > On Tue,  7 Apr 2020 23:12:38 +0200
> > Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > ---
> > >  ...1-Fix-FBXConverter-use-proper-64-bit-constant.patch | 10 ++++++----
> > >  package/assimp/assimp.hash                             |  4 ++--
> > >  package/assimp/assimp.mk                               |  2 +-
> > >  3 files changed, 9 insertions(+), 7 deletions(-)
> >
> > Applied, thanks. Could you submit the patch we have to the upstream
> > project?
>
> Already on my ToDo list ;-)...

Seems Fabrice Fontaine already handled it, see [1], but the change did not
make it into the 5.0.1 release...

Regards,
Peter

[1] https://github.com/assimp/assimp/commit/32781a566db2cd6022c7020ff2ac591d753c11ab

>
> >
> > Also did you test building the qt53d package after this update? It is
> > the only package in Buildroot that uses assimp.
>
> Yes...and compiled without failure after the assimp version bump...
>
> Regards,
> Peter
>
> >
> > Thanks!
> >
> > Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
