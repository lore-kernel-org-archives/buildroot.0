From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 23 Dec 2010 16:36:19 +0100
Subject: [Buildroot] [PATCH] v2 Add UBI image generation support.
In-Reply-To: <20101223135427.3876f009@surf>
References: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
	<20101223135427.3876f009@surf>
Message-ID: <AANLkTi=rRZkFxAwtjbr1GGbQxvHWuufvWfSuy40kfsrd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 23 December 2010 13:54, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,

[...]

> ?* The other solution proposed below is to not add a new root
> ? filesystem type, but rather add a post-processing step to the
> ? rootfs.ubifs image when "Embed in UBI image" is selected. You end up
> ? with rootfs.ubifs in $(O)/images, regardless of whether it is a
> ? UBIFS filesystem image, or a complete UBI image.

How about using .ubi filename extension for UBI images
(and .ubifs for UBIFS) so it's easy to spot what's what?

Best regards,
Bj?rn Forsman
