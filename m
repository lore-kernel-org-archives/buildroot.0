From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Feb 2019 21:47:55 +0100
Subject: [Buildroot] [PATCH v2] qt5: bump latest version to 5.12.1
In-Reply-To: <20190205223104.52ac8996@gmx.net>
References: <20190205212707.12253-1-ps.report@gmx.net>
 <20190205223104.52ac8996@gmx.net>
Message-ID: <20190211214755.3ba7bbb6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 5 Feb 2019 22:31:04 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> On Tue,  5 Feb 2019 22:27:07 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > qt5base:
> >   - removed 0002-double-conversion-enable-for-aarch64_be.patch
> >     (superseeded by upstream commits [1] and [2])
> >   - removed 0003-double-conversion-enable-for-or1k.patch
> >     (superseeded by upstream commits [1] and [2])
> >   - rebased 0004-double-conversion-enable-for-microblaze.patch
> > 
> > [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6a39e49a6cdeb28a04a3657bb6a22f848d5dfa9d
> > [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4d40f09a45202dff901d4f970a6a7e939797138b
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - fix qt5canvas3d hash entry (spotted by Gael PORTAY)
> >   - remove the two patches taken from upstream fixing qendian/qswap
> >     compile related failures
> >   -  
> 
> ...and: - version bump updated from 5.12.0 to 5.12.1

...and qt5webengine compile using raspberrypi3_qt5we_defconfig still fails...

...and qt5webengine legal-info information needs to be fixed (will fix it with
the next patch iteration)...

Regards,
Peter

> 
> Regards,
> Peter
