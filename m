From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 30 Oct 2007 21:00:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20071029004214.GA23959@cloud.net.au>
References: <20071026175010.4296EA6137@busybox.net>
	<20071029004214.GA23959@cloud.net.au>
Message-ID: <1193774405.4478.37.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-10-29 klockan 11:42 +1100 skrev Hamish Moffatt:
> On Fri, Oct 26, 2007 at 10:50:10AM -0700, vanokuten at uclibc.org wrote:
> > Author: vanokuten
> > Date: 2007-10-26 10:50:09 -0700 (Fri, 26 Oct 2007)
> > New Revision: 20321
> > 
> > Log:
> > make microcom visible until it appear in busybox release
> > 
> > Modified:
> >    trunk/buildroot/package/Config.in
> > 
> > 
> > Changeset:
> > Modified: trunk/buildroot/package/Config.in
> > ===================================================================
> > --- trunk/buildroot/package/Config.in	2007-10-24 22:29:30 UTC (rev 20320)
> > +++ trunk/buildroot/package/Config.in	2007-10-26 17:50:09 UTC (rev 20321)
> > @@ -155,7 +155,7 @@
> >  source "package/links/Config.in"
> >  source "package/lrzsz/Config.in"
> >  source "package/mdnsresponder/Config.in"
> > -if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
> > +if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS && !BR2_PACKAGE_BUSYBOX_SNAPSHOT
> >  source "package/microcom/Config.in"
> 
> Shouldn't that be a logical OR rather than AND?
> 

You are right, 
fixed in svn 20334


> Hamish
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
