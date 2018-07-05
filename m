From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Jul 2018 19:30:28 -0300
Subject: [Buildroot] [PATCH 2/3] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
References: <1530818671-20390-1-git-send-email-festevam@gmail.com>
 <1530818671-20390-2-git-send-email-festevam@gmail.com>
 <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
Message-ID: <CAOMZO5C=L=eJqV=4osv3Z1SvgE-S9vsRfEdpt+ss6AU21aOfWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout.

On Thu, Jul 5, 2018 at 6:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  This file only differs from the normal template in the name of the u-boot
> binary, right? So wouldn't it make more sense to make that configurable, just
> like the %FILES%, and handle it in an extra sed line?

That's correct: only the U-Boot binary name differs.

I need to learn how to make this generic as you suggested. I will give it a try.

Thanks
