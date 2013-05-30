From: Nathan Lynch <ntl@pobox.com>
Date: Thu, 30 May 2013 15:36:37 -0500
Subject: [Buildroot] [RFC/PATCH 0/4] support building from read-only
 source tree
In-Reply-To: <20130526163633.GB3380@free.fr>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
 <20130526144540.GA3380@free.fr> <20130526163633.GB3380@free.fr>
Message-ID: <1369946197.13828.33.camel@doorstop.aus.2wire.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2013-05-26 at 18:36 +0200, Yann E. MORIN wrote:
> Nathan, All,
> 
> On 2013-05-26 16:45 +0200, Yann E. MORIN spake thusly:
> > On 2012-06-18 10:02 -0500, Nathan Lynch spake thusly:
> > > There are several places in Buildroot where files are copied from the
> > > source tree to the output directory and then modified.  The most
> > > obvious case is copying a .config or equivalent to the build
> > > directory and then modifying it with sed, as with uClibc or busybox.
> > 
> > Unfortunately, those patches mostly no longer apply, since there have
> > been some code churn (reoridering) in the meantime.
> > 
> > I'll take whatever I can, and adapt the remaining.
> 
> I've added them to my patchwork branch:
>     https://www.gitorious.org/buildroot/buildroot/commits/yem-patchwork-fixes
> 
> Thank you!

Thank you for picking these up.  I haven't been sufficiently motivated
to pursue these (obviously); hopefully they will be useful to others.
