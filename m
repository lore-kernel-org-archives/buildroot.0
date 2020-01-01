From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 17:20:55 +0100
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157c_dk2: disable mkfs
 metadata_csum and dir_index options
In-Reply-To: <20191103115017.788940-1-b.bilas@grinn-global.com>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
Message-ID: <20200101172055.784d5f56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 12:50:16 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> To solve issue with non-possibilities to mount rootfs partition we
> should disable a new mkfs features such as metadata_csum and
> dir_index because there is incompatibility with these options.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  configs/stm32mp157c_dk2_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after changing the patch to only disable the
metadata_csum option, as we discussed in the thread following this
patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
