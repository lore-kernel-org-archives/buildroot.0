From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 06 Aug 2014 18:04:39 -0300
Subject: [Buildroot] [PATCH] configs/imx233_olinuxino: bump to kernel
 3.16
In-Reply-To: <20140806230339.7cb3fa75@free-electrons.com>
References: <1407357831-20429-1-git-send-email-gustavo@zacarias.com.ar>
 <20140806230339.7cb3fa75@free-electrons.com>
Message-ID: <53E29867.1040602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/06/2014 06:03 PM, Thomas Petazzoni wrote:

>>  BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"
> 
> So those patches are still needed?

Hi.
Yes, maybe it's time to drop them, they still work though.
Regards.
