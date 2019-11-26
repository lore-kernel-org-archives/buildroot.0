From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 21:47:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/gadgetfs-test: add an upstream
 URL to Config.in
In-Reply-To: <20191126165956.70a85ba9@windsurf>
References: <20191126153505.31916-1-mark@dibsco.co.uk>
 <20191126165956.70a85ba9@windsurf>
Message-ID: <20191126214723.20877de8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 16:59:56 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 26 Nov 2019 15:35:05 +0000
> Mark Corbin <mark@dibsco.co.uk> wrote:
> 
> > Add an upstream URL to the help text in Config.in. This
> > addresses the 'Missing' URL status in the package stats
> > web page output.
> > 
> > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> > ---
> >  package/gadgetfs-test/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
> > index ca14c91b41..c22134c4a5 100644
> > --- a/package/gadgetfs-test/Config.in
> > +++ b/package/gadgetfs-test/Config.in
> > @@ -4,6 +4,8 @@ config BR2_PACKAGE_GADGETFS_TEST
> >  	help
> >  	  Test program for gadgetfs from linux-usb.org
> >  
> > +	  https://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/  
> 
> Same here, I don't think this adds much value.

To me, this package is another candidate for removal. This is some
really old unmaintained stuff, I'm pretty sure there are much better
things these days to test USB gadget.

Peter ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
