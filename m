From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Sep 2017 22:01:54 +0200
Subject: [Buildroot] [PATCH] board: icorem6: Add qt5 and gst1 support
In-Reply-To: <1506712311-10613-1-git-send-email-chakra.divi@openedev.com>
References: <1506712311-10613-1-git-send-email-chakra.divi@openedev.com>
Message-ID: <20170929220154.21a7295f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Sep 2017 00:41:51 +0530, Chakra Divi wrote:

>  engicam_imx6qdl_icore_defconfig: *defconfig
>  engicam_imx6qdl_icore_qt5_defconfig: *defconfig
> +engicam_imx6qdl_icore_qt5_gst1_defconfig: *defconfig

I clearly don't think we want gazillions of defconfigs for the same
board. So please merge this into the qt5 defconfig, instead of adding a
new one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
