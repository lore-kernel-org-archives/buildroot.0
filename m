From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Fri, 20 Mar 2015 10:02:49 +0100
Subject: [Buildroot] [PATCH v2] configs: add defconfig for Freescale
	i.MX31 PDK
In-Reply-To: <550B4081.3070906@mind.be>
References: <550A0AF9.5050101@mind.be>
 <1426780358-15223-1-git-send-email-vincent.stehle@freescale.com>
 <550B4081.3070906@mind.be>
Message-ID: <550BE239.80501@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2015 10:32 PM, Arnout Vandecappelle wrote:
(kernel patch to enable initramfs)
> This shouldn't be needed, since buildroot will enable these automatically when
> cpio or initramfs filesystem is selected.

Hi Arnout,

Thanks for this remark; I did not know about this buildroot feature, and
this works fine indeed. I will send a v3 right away.

Best regards,

V.
