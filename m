From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 26 Nov 2019 23:34:55 +0100
Subject: [Buildroot] [PATCH v1] libdrm: disable nouveau test for static
 build
In-Reply-To: <20191125181648.52baa9ad@windsurf>
References: <20191125151229.31626-1-ps.report@gmx.net>
 <20191125181648.52baa9ad@windsurf>
Message-ID: <20191126233455.0fbd0b10@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 25 Nov 2019 18:16:48 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 25 Nov 2019 16:12:29 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Fixes:
> >
> >   [46/66] Compiling C object 'tests/nouveau/e47a46e@@threaded at exe/threaded.c.o'.
> >   FAILED: tests/nouveau/e47a46e@@threaded at exe/threaded.c.o
> >   ./tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory
> >   #include <dlfcn.h>
> >
> > [1] http://autobuild.buildroot.net/results/3042637f54d2d232904ea009455cae82e159ea2e
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...d-disable-nouveau-tests-for-static-b.patch | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>
> Applied to master, thanks. Could you submit the patch upstream ?

Done, see [1]...

Regards,
Peter

[1] https://gitlab.freedesktop.org/mesa/drm/merge_requests/29

>
> Thanks,
>
> Thomas
