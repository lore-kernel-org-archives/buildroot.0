From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 18:35:52 +0200
Subject: [Buildroot] [PATCH V2 1/3] i.MX: Use FREESCALE_IMX_MIRROR_SITE
 for newly-moved packages
In-Reply-To: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20131006183552.52dcf84d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Sun,  6 Oct 2013 08:33:42 -0700, Eric Nelson wrote:
> Now that libfslcodec, libfslparser, and libfslvpuwrap are in
> the package/freescale-imx directory, they can share the
> _SITE mirror with other similar packages.

This commit message doesn't match what the patch is doing :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
