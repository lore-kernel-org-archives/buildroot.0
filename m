From: Connolly, Padraig <padraig.connolly@intel.com>
Date: Mon, 29 Aug 2016 12:32:02 +0000
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
 kernel
In-Reply-To: <20160829131959.09cf41e3@free-electrons.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
 <20160822163337.484cb311@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE25B11@irsmsx105.ger.corp.intel.com>
 <20160823112531.13f75bab@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE27080@irsmsx105.ger.corp.intel.com>
 <20160829131959.09cf41e3@free-electrons.com>
Message-ID: <E704BB48EC9FDF4FA0A7A278C2546ACFE270E6@irsmsx105.ger.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

That's perfect, I will do that.  I will also have to
update the .config file as some of the configuration
names have changed with the new 3.14 kernel.

Can you update the status of this patch or will I 
submit a new one?

Thanks,
Padraig Connolly

-----Original Message-----

Hello,

On Mon, 29 Aug 2016 10:20:18 +0000, Connolly, Padraig wrote:

> Currently there is support for the Quark X1000 SoC itself in the upstream Linux Kernel 
> but support for the Galileo Gen 1/2 is not fully upstream, there is a Galileo platform driver that is not upstream.
> There is also some fixes that affect the USB behavior that are not upstream either.
> 
> This means anything supported by the platform driver will not work with the upstream kernel, 
> for example GPIO, I2C, and SPI.  USB device support is also less reliable without the fix.
> 
> You can find the platform driver in our GitHub repo here : 
> https://github.com/padraigconnolly/Linux-x1000/tree/master/drivers/platform/x86/intel-quark

Then, it's fine to use a non-upstream kernel for this platform. Just
update the existing galileo_defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
