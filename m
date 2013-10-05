From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sat, 05 Oct 2013 07:52:55 -0700
Subject: [Buildroot] [PATCH 0/4] i.MX: Refactor and update library
	versions
In-Reply-To: <20131005133630.7f799fd6@skate>
References: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>	<524F4541.1090004@boundarydevices.com>
 <20131005133630.7f799fd6@skate>
Message-ID: <525027C7.6040608@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

On 10/05/2013 04:36 AM, Thomas Petazzoni wrote:
> Dear Eric Nelson,
>
> On Fri, 04 Oct 2013 15:46:25 -0700, Eric Nelson wrote:
>
>> On 09/29/2013 03:54 PM, Eric Nelson wrote:
>>> This patch set restructures several libraries to share common
>>> Makefile fragments in package/freescale-imx and bumps the
>>> library versions to match the Freescale 3.0.35_4.1.0 release
>>> for i.MX6.
>>>
>>
>> Thomas and Arnout: do you want these to stay in /package?
>
> I don't have a strong opinion on this one. If they use the
> FREESCALE_IMX_MIRROR / FREESCALE_IMX_VERSION variable, I would find it
> more logical to have them under package/freescale-imx/, but it's really
> not a strong requirement.
>
Arnout, you seemed to prefer keeping them where they were.

If that's still the case, I'll rework them in-place, which
will be a smaller commit.

Regards,


Eric
