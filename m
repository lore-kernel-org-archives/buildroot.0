From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Aug 2017 16:49:19 -0300
Subject: [Buildroot] [PATCH v3] imx6q-sabresd: Add a qt5 defconfig
	variant
In-Reply-To: <47e21512-545b-5183-7397-844035c9818f@mind.be>
References: <1498078187-32377-1-git-send-email-festevam@gmail.com>
 <47e21512-545b-5183-7397-844035c9818f@mind.be>
Message-ID: <CAOMZO5ACVkLqxWmwFY3kBPjhPVOVs0J_Tq__jZJ29_YFXBFjHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Aug 3, 2017 at 4:06 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Fabio, I applied to next, with a lot of changes:
>
>      - Add Fabio to DEVELOPERS
>      - Rename linux config fragment to linux_qt5.fragment
>      - Add comment to linux_qt5.fragment why it is needed
>      - Add explicit CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y to it
>      - Reorder defconfig entries to they match imx6q-sabresd_defconfig
>      - Remove strace and host-uboot-tools, neither seems to be needed
>      - Drop BR2_PACKAGE_QT5BASE_LICENSE_APPROVED, it no longer exists
>      - Replace BR2_TARGET_ROOTFS_EXT2_BLOCKS with BR2_TARGET_ROOTFS_EXT2_SIZE
>      - Regenerate .gitlab-ci.yml
>
>  Could you re-test based on the next branch?

Thanks for reworking the patch and applying it.

I am currently out of the office without hardware access to test it.

Will test it as soon as I am back to the office (week of August 21)

>
>  Also, you set BR2_TOOLCHAIN_BUILDROOT_GLIBC=y but none of the packages selected
> seem to need it. Is there a reason why it is needed? Could you either remove it
> (after testing with uClibc-ng) or add a comment why it is needed and remove
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y?

Sure, will do it.

Thanks
