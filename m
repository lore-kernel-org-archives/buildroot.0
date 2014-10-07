From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 00:25:50 +0200
Subject: [Buildroot] [PATCH] configs/olimex_imx233_olinuxino: bump
	kernel to version 3.17
In-Reply-To: <1412720339-11029-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 Oct 2014 19:18:59 -0300")
References: <1412720339-11029-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vbnvecup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 > -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.16.config"
 > -BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"

From the discussion on IRC I understood that this (non-upstream) patch
no longer applies. I've added a note to the commit message and committed, thanks.

-- 
Bye, Peter Korsgaard
