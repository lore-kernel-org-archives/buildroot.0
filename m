From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Tue, 24 Mar 2015 19:51:04 +0100
Subject: [Buildroot] [PATCH v4] configs: add defconfig for Freescale
	i.MX31 PDK
In-Reply-To: <550DAA15.7070103@mind.be>
References: <550B3F16.60600@mind.be>
 <1426863456-2581-1-git-send-email-vincent.stehle@freescale.com>
 <550DAA15.7070103@mind.be>
Message-ID: <5511B218.2090702@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/21/2015 06:27 PM, Arnout Vandecappelle wrote:
..
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Hi Arnout,

Thank you for your efforts reviewing this patch.

..
>> +BR2_DEFAULT_KERNEL_VERSION="3.15.10"
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
>  It would be good to add a comment here that explains that upstream is broken
> since 3.16.

Sure, why not? I'll resend a v5 right away, with a quick comment in the
config file.

>  It would be even better to fix upstream :-)

I could not agree more :) I'll try to bisect at least, but this week is
a bit more busy for me.

Best regards,

V.
