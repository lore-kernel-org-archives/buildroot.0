From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sun, 8 May 2016 22:32:18 +0200
Subject: [Buildroot] [PATCH 17/34] reproducibility/libnspr: override
 build timestamps
In-Reply-To: <20160507222707.2420ef79@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-17-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507222707.2420ef79@free-electrons.com>
Message-ID: <20160508203218.GV13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 07, 2016 at 10:27:07PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 30 Apr 2016 09:49:13 +0200, Gilles Chanteperdrix wrote:
> > with SOURCE_DATE_EPOCH
> 
> Missing SoB line here.
> 
> > ---
> >  package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch | 71 ++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch
> > 
> > diff --git a/package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch b/package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch
> > new file mode 100644
> > index 0000000..1a0fb7c
> > --- /dev/null
> > +++ b/package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch
> 
> Missing patch description and Signed-off-by line. Also, did you submit
> this upstream?

No, it looks a bit specific to me.

> Does Debian carry a similar patch for its Reproducible Builds effort?

No idea.

-- 
					    Gilles.
https://click-hack.org
