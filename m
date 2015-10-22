From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Thu, 22 Oct 2015 12:08:50 +0200
Subject: [Buildroot] [PATCH v2] board/freescale: switch
	create-boot-sd.sh to parted
In-Reply-To: <5627DB79.7020001@mind.be>
References: <CAAMH-ysuKMKY6AXbtJqALq0jr3fs1-j0e_Pf=Qrm8BvUuTimKg@mail.gmail.com>
 <1445417826-9634-1-git-send-email-vincent.stehle@freescale.com>
 <5627DB79.7020001@mind.be>
Message-ID: <5628B5B2.3070807@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/2015 08:37 PM, Arnout Vandecappelle wrote:
..
>  Is there any reason why genimage (cfr. wandboard) wouldn't work, like I
> suggested earlier?

Hi Arnout,

You are right, genimage seems like a nice solution. In fact I think I
prefer this SD card image generation approach over the direct SD card
modification method.

Thank you for this suggestion.

Best regards,

V.
