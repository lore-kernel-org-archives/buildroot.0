From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 10:19:38 +0100
Subject: [Buildroot] [PATCH] ethtool: Allow enabling/disabling pretty
 printing
In-Reply-To: <20171106090757.kekhjjkecm3ck3e3@sapphire.tkos.co.il>
References: <20171106012906.22000-1-f.fainelli@gmail.com>
 <87zi7zyeju.fsf@dell.be.48ers.dk>
 <20171106100535.1ae977ce@windsurf.home>
 <20171106090757.kekhjjkecm3ck3e3@sapphire.tkos.co.il>
Message-ID: <20171106101938.327397d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Nov 2017 11:07:57 +0200, Baruch Siach wrote:

> On Mon, Nov 06, 2017 at 10:05:35AM +0100, Thomas Petazzoni wrote:
> > On Mon, 06 Nov 2017 09:52:37 +0100, Peter Korsgaard wrote:
> >   
> > >  > +if BR2_PACKAGE_ETHTOOL
> > >  > +
> > >  > +	config BR2_PACKAGE_ETHTOOL_PRETTY_PRINT
> > >  > +		bool "enable pretty printing"
> > >  > +		default y  
> > 
> > Should this really be "default y" ? Baruch reported a significant size
> > increase with this option enabled.  
> 
> This is the current default. The added option only allows to to remove pretty 
> printing.

Aah, ok. Works for me then.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
