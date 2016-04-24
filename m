From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 09:53:15 +0200
Subject: [Buildroot] [PATCH v4 6/7] barebox: support 2nd config build
In-Reply-To: <5702F7E0.1060601@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-7-git-send-email-pieter@boesman.nl>
 <5702F7E0.1060601@mind.be>
Message-ID: <20160424075315.GA3082@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Apr 05, 2016 at 01:25:20AM +0200, Arnout Vandecappelle wrote:
> On 03/20/16 23:35, Pieter Smith wrote:
> >Adds support to build barebox with a 2nd config.
> >
> >This is useful for building an SPL (Secondary Program Loader) in addition to
> >the traditional TPL (Tertiary Program Loader). The Beaglebone Black for example
> >has two barebox configurations:
> >- am335x_defconfig builds the full barebox bootloader with device tree, and
> >- am335x_mlo_defconfig builds the smaller MLO bootloader that loads the full
> >   barebox bootloader from the eMMC or SD card.
> >
> >Signed-off-by: Pieter Smith<pieter@boesman.nl>
> 
>  Looks good to me, except for the comments I made for barebox-1:
> 
> - BR2_TARGET_BAREBOX_2_BUILT_IMAGE_FILE name+prompt;
> 
> - BR2_TARGET_BAREBOX_2_OUTPUT_IMAGE_FILE name or maybe remove;
> 
> - Redundant $(call ...)

All three are resolved in patch v5.

[snip]

Regards,
Pieter
