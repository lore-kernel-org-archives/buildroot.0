From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 13 Feb 2018 17:44:28 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webengine: fix build issue with alsa
In-Reply-To: <20180213232229.5e36149c@windsurf.lan>
References: <20180209012236.5118-1-gael.portay@savoirfairelinux.com>
 <20180209013535.iazotrv3kjwzb4np@archlinux>
 <20180213232229.5e36149c@windsurf.lan>
Message-ID: <20180213224428.vbbv4nfkgxstp32s@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 13, 2018 at 11:22:29PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 8 Feb 2018 20:35:36 -0500, Ga?l PORTAY wrote:
> > On Thu, Feb 08, 2018 at 08:22:36PM -0500, Ga?l PORTAY wrote:
> > > +config BR2_PACKAGE_QT5WEBENGINE_ALSA
> > > +	bool "alsa"
> > > +	depends on BR2_PACKAGE_ALSA_LIB  
> > 
> > Well, I should probably select BR2_PACKAGE_ALSA_LIB instead of depending
> > on it :/
> 
> Are you going to submit an updated version ?
> 

Let me test again the fix with select and I will send a v2 shortly.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Gael
