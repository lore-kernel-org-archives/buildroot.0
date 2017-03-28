From: James Balean <james@balean.com.au>
Date: Mon, 27 Mar 2017 20:19:49 -0500
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
In-Reply-To: <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
Message-ID: <1490663989-14886-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for your reviewing this patch and for your response.

On 27 March 2017 at 23:12, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Would it make sense to add
>         default BR2_LINUX_KERNEL_CUSTOM_DTS_PATH if BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> ?

>  Perhaps also
>         depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> (AFAIK it's not possible to link in a DTB in the legacy build system.)

>  Indentation should be 1 tab + 2 spaces, and wrap at 72 columns (where tab
> counts as 8, so 62 significant characters).

>  Perhaps you can add
>
>           To use this device tree source file, the U-Boot configuration
>           file must refer to it.

All very good suggestions, which I will incorporate in a new version of the patch shortly.

Thanks again,
James
-- 
2.7.4
