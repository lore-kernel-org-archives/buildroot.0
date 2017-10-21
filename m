From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Oct 2017 21:33:28 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: fix openjpeg-2.3
 compile failure
In-Reply-To: <20171021212422.55322cb1@windsurf>
References: <20171021191617.17358-1-ps.report@gmx.net>
 <20171021212422.55322cb1@windsurf>
Message-ID: <20171021213328.474317e5@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 21 Oct 2017 21:24:22 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sat, 21 Oct 2017 21:16:17 +0200, Peter Seiderer wrote:
> > Add upstream patch [1], fixes [2]:
> > 
> >   In file included from gstopenjpegdec.h:29:0,
> >                    from gstopenjpegdec.c:27:
> >   gstopenjpeg.h:42:37: fatal error: openjpeg-2.2/openjpeg.h: No such file or directory
> >   #  include <openjpeg-2.2/openjpeg.h>
> > 
> > [1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=bff2d834a4a38f64e555cee3d0144fde6c515acd
> > [2] http://autobuild.buildroot.net/results/884/884956af56f63b2634a1984f5ea416075ed87bc8
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...upport-building-with-openjpeg-2.3-simpler.patch | 134 +++++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >  create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch  
> 
> Applied to master, thanks.

Ups, to fast, I messed up the patch and have just sent a v2 one...

Regards,
Peter

> 
> Thomas
