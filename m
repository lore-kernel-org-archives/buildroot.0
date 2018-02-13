From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:22:29 +0100
Subject: [Buildroot] [PATCH 1/1] qt5webengine: fix build issue with alsa
In-Reply-To: <20180209013535.iazotrv3kjwzb4np@archlinux>
References: <20180209012236.5118-1-gael.portay@savoirfairelinux.com>
 <20180209013535.iazotrv3kjwzb4np@archlinux>
Message-ID: <20180213232229.5e36149c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Feb 2018 20:35:36 -0500, Ga?l PORTAY wrote:
> On Thu, Feb 08, 2018 at 08:22:36PM -0500, Ga?l PORTAY wrote:
> > +config BR2_PACKAGE_QT5WEBENGINE_ALSA
> > +	bool "alsa"
> > +	depends on BR2_PACKAGE_ALSA_LIB  
> 
> Well, I should probably select BR2_PACKAGE_ALSA_LIB instead of depending
> on it :/

Are you going to submit an updated version ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
