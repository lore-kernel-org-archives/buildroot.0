From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 8 Sep 2017 15:31:18 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <20170908085622.57eddaa9@windsurf.lan>
References: <20170907211628.18644-1-ps.report@gmx.net>
 <20170908085622.57eddaa9@windsurf.lan>
Message-ID: <20170908153118.19f46256@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 8 Sep 2017 08:56:22 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Thu,  7 Sep 2017 23:16:28 +0200, Peter Seiderer wrote:
> > diff --git a/package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch b/package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch
> > new file mode 100644
> > index 0000000000..ccac1f1073
> > --- /dev/null
> > +++ b/package/gstreamer1/gst1-plugins-bad/0002-Bump-gettext-version-to-0.19.patch
> > @@ -0,0 +1,46 @@
> > +From 750da2a0dbaaefa4e702bf7ede16917b57b7efa8 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Thu, 7 Sep 2017 23:01:44 +0200
> > +Subject: [PATCH] Bump gettext version to 0.19
> > +
> > +Fixes autoreconf failure:
> > +
> > +  *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.19
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> I think the normal fix for this is to add <pkg>_GETTEXTIZE = YES in the
> package.

Thanks for the tip (did not know about it yet)...new patch version follows...

Regards,
Peter

> 
> Thomas
