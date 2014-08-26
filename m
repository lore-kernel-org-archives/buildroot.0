From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 25 Aug 2014 21:13:04 -0700
Subject: [Buildroot] [PATCH] imx6sabresd: boot to /init in mfgtools mode
In-Reply-To: <1407833366-21448-1-git-send-email-vincent.stehle@freescale.com>
References: <1407833366-21448-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <CADCpmyNfWhXzG2ud=XQFdZdpvvM2XhSM-ABM47TOy2kqDmLTgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

Sorry for the delay in my feedback.

On Tue, Aug 12, 2014 at 1:49 AM, Vincent Stehl? <
vincent.stehle@freescale.com> wrote:

> Buildroot supplies a nice /init wrapper script to use when booting from a
> ramdisk.
>
> We add a patch to u-boot to tell the kernel to boot into /init (instead of
> /linuxrc) on i.MX6, when booting in mfgtools mode. This way we can boot a
> buildroot system entirely through USB.
>

The patch looks fine however shouldn't it be pushed to u-boot directly?
Also, as it can be changed through u-boot commands I'm not sure it is
necessary.

Let me know your thoughts.

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140825/3e32b741/attachment.html>
