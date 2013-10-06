From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun, 06 Oct 2013 09:50:23 -0700
Subject: [Buildroot] [PATCH V2 2/3] i.MX6: Use canonical site for
 Freescale packages
In-Reply-To: <20131006183807.3a87ff12@skate>
References: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>	<1381073624-27739-2-git-send-email-eric.nelson@boundarydevices.com>
 <20131006183807.3a87ff12@skate>
Message-ID: <525194CF.70800@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

On 10/06/2013 09:38 AM, Thomas Petazzoni wrote:
> Dear Eric Nelson,
>
> On Sun,  6 Oct 2013 08:33:43 -0700, Eric Nelson wrote:
>> -# No official download site from freescale, just this mirror
>> -FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
>> +FREESCALE_IMX_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
>> +#FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
>
> Please don't keep this as a comment.
>
> Also, this patch actually does two things: renaming the variable, and
> change the site from download.ossystems.com.br to freescale.com. I
> believe the switch to freescale.com does not work if you don't also
> bump the version at the same time, so I'd suggest that:
>
>   * this patch only renames the variable from IMX_MIRROR_SITE to
>     IMX_SITE, but does not change its value
>
>   * the change from ossystems.com.br to freescale.com is done in the
>     following patch that bumps the version.
>

That's definitely cleaner, and I'll work up a V3.
