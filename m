From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@laposte.net>
Date: Sun, 28 Dec 2014 22:13:16 +0100
Subject: [Buildroot] [PATCH] openocd: bump to version 0.8.0
In-Reply-To: <20141228173148.5b1332bb@free-electrons.com>
References: <1419777098-6809-1-git-send-email-vincent.stehle@laposte.net>
 <20141228173148.5b1332bb@free-electrons.com>
Message-ID: <54A0726C.7020602@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+Claudio

On 12/28/2014 05:31 PM, Thomas Petazzoni wrote:
> Thanks for this contribution. There is already a patch in patchwork to
> bump OpenOCD to version 0.8.0, see
> http://patchwork.ozlabs.org/patch/420900/. Would it be possible to sync
> with this proposal to propose a single patch set for OpenOCD ?

Thanks Thomas; you are right, I forgot to check the patch tracker. Now I
picked patch 420900 in my branch and it works fine for me (on one
configuration).

Dear Claudio, thank you for your patch. You may add a

    Tested-by: Vincent Stehl? <vincent.stehle@laposte.net>

...if you want (for what it's worth :). All what is left of my
submission is the hash file addition. I'll re-send that right away.
Please feel free to "squash it" into patch 420900, or keep it separate
as you prefer.

Best regards,

V.
