From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 25 Aug 2014 21:19:39 -0700
Subject: [Buildroot] [PATCH v2 1/2] configs/freescale_imx6dlsabresd: add
 defconfig for iMX6DL SabreSD
In-Reply-To: <1408019813-17702-1-git-send-email-luca@lucaceresoli.net>
References: <1408019813-17702-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <CADCpmyN=pUb+fMjDwxQFbPCY-59=s4Ont82UuW1FUu452Ng23w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Thu, Aug 14, 2014 at 5:36 AM, Luca Ceresoli <luca@lucaceresoli.net>
wrote:

> This is very similar to freescale_imx6sabresd_defconfig, which supports the
> i.MX6Q ("Quad", quad core CPU) version of the board, except it supports the
> i.MX6DL (DualLite, dual core CPU) version.
>
> The differences are in the U-boot configuration and the device tree file.
>

Looks good to me, however I would then rename the previous
freescale_imx6sabresd_defconfig to freescale_imx6qsabresd_defconfig in
order for it to be clear.

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140825/174bc795/attachment.html>
