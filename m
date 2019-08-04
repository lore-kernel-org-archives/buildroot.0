From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 4 Aug 2019 22:50:30 +0200
Subject: [Buildroot] [PATCH v7] libdrm: change to meson build system
In-Reply-To: <20190804102807.5b0d142d@windsurf.home>
References: <20190625201128.24781-1-ps.report@gmx.net>
 <20190804102807.5b0d142d@windsurf.home>
Message-ID: <20190804225030.616e29fd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 4 Aug 2019 10:28:07 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

Hello Thomas,

> On Tue, 25 Jun 2019 22:11:27 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - remove legacy patch
> >   0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> >
> > - add patch to fix meson atomic ops detection
> >   0003-meson.build-fix-intel-atomics-detection.patch
> >
> > - add patch to enable static build
> >   0004-meson.build-enable-static-build.patch
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >   - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
> >     is missing (maybe meson gets it right (?) or use LIBDRM_CFLAGS
> >     to force it)
>
> Applied to master, thanks. However, there is already one build failure,
> I'm not sure if it's directly related to the meson change:
>
>   http://autobuild.buildroot.net/results/d15/d15ed604756cac4e4a87afca61b7a4778f293baf/build-end.log

Ups, known issue ;-) and reminds me of an old (but not yet ready for submission) patch in my
git repository fixing the issue, draft submitted ([1]) just now...

Updated version (with proper commit log, autobuild referecen etc.) will follow...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1141849/

>
> Best regards,
>
> Thomas
