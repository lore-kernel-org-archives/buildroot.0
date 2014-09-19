From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 19 Sep 2014 15:48:39 +0200
Subject: [Buildroot] [PATCH] imx6sabresd: boot to /init in mfgtools mode
In-Reply-To: <1407833366-21448-1-git-send-email-vincent.stehle@freescale.com>
References: <1407833366-21448-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <541C3437.6000906@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

Vincent Stehl? wrote:
> Buildroot supplies a nice /init wrapper script to use when booting from a
> ramdisk.
>
> We add a patch to u-boot to tell the kernel to boot into /init (instead of
> /linuxrc) on i.MX6, when booting in mfgtools mode. This way we can boot a
> buildroot system entirely through USB.
>
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Gary Bisson <bisson.gary@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
> Cc: Gilles Talis <gilles.talis@gmail.com>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

However, as you pointed out, this conflicts with my patches to support
i.MX6DL. So I've rebased my patches on current master and added yours
on top, adapted and completed with i.MX6DL support.

I'll send this patchset in a while, with the addition of my Tested-by
tag.

-- 
Luca
