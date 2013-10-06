From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 10:58:37 +0200
Subject: [Buildroot] [PATCH 0/4] i.MX: Refactor and update library
 versions
In-Reply-To: <525027C7.6040608@boundarydevices.com>
References: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
 <524F4541.1090004@boundarydevices.com>
 <20131005133630.7f799fd6@skate>
 <525027C7.6040608@boundarydevices.com>
Message-ID: <20131006105837.69d64d1e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Sat, 05 Oct 2013 07:52:55 -0700, Eric Nelson wrote:

> > I don't have a strong opinion on this one. If they use the
> > FREESCALE_IMX_MIRROR / FREESCALE_IMX_VERSION variable, I would find it
> > more logical to have them under package/freescale-imx/, but it's really
> > not a strong requirement.
> >
> Arnout, you seemed to prefer keeping them where they were.
> 
> If that's still the case, I'll rework them in-place, which
> will be a smaller commit.

Yes, seems good to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
