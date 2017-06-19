From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:17:59 +0200
Subject: [Buildroot] [PATCH v4 1/6] board: Add support for Engicam
 i.CoreM6 DualLite/Solo boards
In-Reply-To: <1497857252-8308-2-git-send-email-jteki@openedev.com>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
 <1497857252-8308-2-git-send-email-jteki@openedev.com>
Message-ID: <20170619221759.63450810@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 12:57:27 +0530, Jagan Teki wrote:

> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05-rc1"

This doesn't make sense. Why are you rolling back from 2017.05 to
2017.05-rc1 ?

I assume a feature present in the -rc1 is also present in the final
release. Otherwise, it means the feature has been reverted, which is a
bad sign.

Maybe you wanted to use 2017.07-rc1 instead?

If so, could you please fix this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
