From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 7 Oct 2015 17:50:07 +0200
Subject: [Buildroot] [PATCH v1 1/3] libv4l: update v4l-utils help text
 (add more listed tools)
In-Reply-To: <20151007083512.0460326f@free-electrons.com>
References: <1444165338-19896-1-git-send-email-ps.report@gmx.net>
 <20151007083512.0460326f@free-electrons.com>
Message-ID: <20151007175007.7c464961@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 7 Oct 2015 08:35:12 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Peter Seiderer,
> 
> On Tue,  6 Oct 2015 23:02:16 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/libv4l/Config.in | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> > index d137613..5a55b2b 100644
> > --- a/package/libv4l/Config.in
> > +++ b/package/libv4l/Config.in
> > @@ -26,8 +26,16 @@ config BR2_PACKAGE_LIBV4L_UTILS
> >  	help
> >  	  v4l-utils is a collection of various video4linux and DVB utilities.
> >  	  Enable this if you want to build the following tools:
> > -	  cx18-ctl, ir-keytable, ivtv-ctl, v4l2-ctl, v4l2-sysfs-path and
> > -	  others.
> > +	  - cx18-ctl
> > +	  - dvb-fe-tool, dvbv5-zap, dvbv5-scan, dvb-format-convert
> > +	  - decode_tm6000
> > +	  - ir-keytable
> > +	  - media-ctl
> > +	  - v4l2-compliance
> > +	  - v4l2-ctl, cx18-ctl, ivtv-ctl
> > +	  - v4l2-sysfs-path
> > +	  - rds-ctl
> > +	  - qv4l2 (if Qt is enabled)
> 
> To make the things more future-proof, shouldn't we remove the list of
> tools, and just say "Enable this option to enable various tools to
> control Video4Linux devices" (or some other better wording) ?

This has pro and cons, my reasoning was to mention media-ctl somewhere before
removing the superfluously extra media-ctl package (as hint for people who are
not that familiar with the v4l-utils package)...

Regards,
Peter

> 
> Thomas
