From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun, 06 Oct 2013 09:49:13 -0700
Subject: [Buildroot] [PATCH V2 1/3] i.MX: Use FREESCALE_IMX_MIRROR_SITE
 for newly-moved packages
In-Reply-To: <20131006183552.52dcf84d@skate>
References: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
 <20131006183552.52dcf84d@skate>
Message-ID: <52519489.90006@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the review, Thomas.

On 10/06/2013 09:35 AM, Thomas Petazzoni wrote:
> Dear Eric Nelson,
>
> On Sun,  6 Oct 2013 08:33:42 -0700, Eric Nelson wrote:
>> Now that libfslcodec, libfslparser, and libfslvpuwrap are in
>> the package/freescale-imx directory, they can share the
>> _SITE mirror with other similar packages.
>
> This commit message doesn't match what the patch is doing :-)
>

Will fix & re-send.
