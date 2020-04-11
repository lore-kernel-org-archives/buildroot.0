From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 11 Apr 2020 17:09:55 +0200
Subject: [Buildroot] [RFC v4 1/3] package/qt5: bump version to 5.13.2
In-Reply-To: <20200411150147.4849dfe9@windsurf.home>
References: <20200403212357.26997-1-ps.report@gmx.net>
 <20200411150147.4849dfe9@windsurf.home>
Message-ID: <20200411170955.5271eace@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 11 Apr 2020 15:01:47 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri,  3 Apr 2020 23:23:55 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > qt5canvas3d:
> >  - removed with 5.13 according to [1]
> >
> > qt5webengine:
> >  - remove 0001-pkg_config-Fixes-when-use_sysroot-false.patch
> >    (taken from upstream [2])
> >  - update 3rdparty license hash list and chromium-latest.inc file
> >
> > [1] https://doc.qt.io/qt-5/whatsnew513.html
> > [2] https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - remove spurious qt5base commit log entry (leftover from some
> >     early draft, suggested by Thomas Petazzoni)
> >   - fix qt5scxml vs. qt5canvas3d typo, reword comment message and
> >     fix indent, remove unneeded license condition (suggested by
> >     Thomas Petazzoni)
>
> I've added a Config.in.legacy entry for the removed qt5canvas3d option,
> and then applied. Thanks!

Thanks for fixing it (now I can scratch this point from my ToDo list ;-)...

Regards,
Peter

>
> Thomas
