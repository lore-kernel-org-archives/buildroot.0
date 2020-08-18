From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:49:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump version to 3.21
In-Reply-To: <20200817132336.1110072-1-olivier.dautricourt@orolia.com>
References: <20200817132336.1110072-1-olivier.dautricourt@orolia.com>
Message-ID: <20200818164919.498452cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your patch.

On Mon, 17 Aug 2020 15:23:35 +0200
Olivier Dautricourt <olivier.dautricourt@orolia.com> wrote:

> - removed unnecessary patch
> - removed obsolete gpsd options:
> 	GPSD_CONTROLSEND
> 	GPSD_RECONFIGURE
> 	GPSD_FIXED_PORT_SPEED

Could you comment about what happened to those options? Why were they
removed? Indeed, we can't just drop Buildroot options like that.
Depending on what happened to the corresponding features in upstream
gpsd, we might need to add legacy handling for those options in
Config.in.legacy.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
