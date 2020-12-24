From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 24 Dec 2020 12:08:30 +0100
Subject: [Buildroot] [PATCH 00/15] Bump NXP BSP components to
 5.4.47_2.2.0
In-Reply-To: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <X+R2rtZz0sZ+UuOl@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Thu, Dec 24, 2020 at 07:59:38AM +0100, Stephane Viau wrote:
> Hello all,
> 
> Here is a patch set to bump freescale-imx configs and packages to match
> the latest publicly availaible Linux release, that is 5.4.47_2.2.0.
> Some are run-tested, others aren't... but all are build-tested.

Thanks you for this series. I'm wondering why you haven't used latest
5.4.70_2.3.0 release from NXP? [1]
This new release is a GA for all platforms including i.MX 8M Plus which
would be nice to have in BR.
Let me know if you can respin with latest packages?

Regards,
Gary

[1] https://source.codeaurora.org/external/imx/meta-imx/tree/?h=zeus-5.4.70-2.3.0
