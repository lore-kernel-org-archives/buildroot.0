From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:41:06 +0200
Subject: [Buildroot] [PATCH] orangepi_pc_defconfig: bump linux to 4.17,
 u-boot to 2018.05
In-Reply-To: <20180609143132.27879-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 9 Jun 2018 16:31:32 +0200")
References: <20180609143132.27879-1-peter@korsgaard.com>
Message-ID: <87po0xcdrh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > 4.17 brings support for HDMI out, but sunxi_defconfig hasn't been updated to
 > enable the drivers - So add a kernel fragment to enable them.

 > Likewise, analog audio has been supported since 4.10, but the driver isn't
 > enabled in sunxi_defconfig, so enable it in the fragment.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
