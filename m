From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 14 Apr 2014 10:43:11 +0200
Subject: [Buildroot] [PATCH] mesa3d: fix khrplatform.h installation.
In-Reply-To: <20140412161019.70e50f23@skate>
References: <1397048061-31767-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140412161019.70e50f23@skate>
Message-ID: <20140414084311.GA5385@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Sat, Apr 12, 2014 at 04:10:19PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Wed,  9 Apr 2014 14:54:21 +0200, Eric Le Bihan wrote:
> > Mesa3D only installs khrplatform.h if EGL support is enabled, whereas
> > this header file is needed by the headers of OpenGL|ES and OpenVG.
> >
> > The supplied patch forces Mesa3D to install this header unconditionally.
> >
> > Fixes http://autobuild.buildroot.net/results/e07/e079219d70830a123977c3ee09d3c11b863d0691
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  ...atform.h-not-installed-if-EGL-is-disabled.patch | 44 ++++++++++++++++++++++
> >  package/mesa3d/mesa3d.mk                           |  1 +
> >  2 files changed, 45 insertions(+)
> >  create mode 100644 package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
>
> I've applied the patch. However, I really would like this one to be
> submitted upstream, to also get a confirmation that this is the correct
> fix for the problem.
Me too! I submitted the patch here:
https://bugs.freedesktop.org/show_bug.cgi?id=77240.

Best regards,
ELB
