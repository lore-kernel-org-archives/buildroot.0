From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 1 Jun 2016 11:45:24 +0100
Subject: [Buildroot] [RESEND] [PATCH 2/2] configs: add u-noot and
 atfirmware options to juno
In-Reply-To: <20160601103734.GB23566@e106497-lin.cambridge.arm.com>
References: <cover.1462269854.git.jpinto@synopsys.com>
 <b0b00c7eeea5a904f3c7c7170716a3b55535e6b6.1462269854.git.jpinto@synopsys.com>
 <20160601103734.GB23566@e106497-lin.cambridge.arm.com>
Message-ID: <f9ad9c6d-98e5-002d-5b10-85c3f13ab26b@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 6/1/2016 11:37 AM, Liviu.Dudau at arm.com wrote:
> Hi Joao,
> 
> Your commit subject contains a mis-spelling of U-Boot.
> 
> Also, your "Resend" is not the same version as the original, you have changed
> BR2_TARGET_UBOOT_DEFCONFIG into BR2_TARGET_UBOOT_BOARDNAME. I've discovered
> that because I have applied your original patch and not the "Resend". Please
> label the patches correctly and add version number and logs to the 0/x email
> at least.

You spotted that right, thanks! Going to send e v2 in a sec.

> 
> I've given the build a go, it boots fine on my Juno r0 board (well, mostly,
> the hardcoded command line is waiting for /dev/sda2 which is not going to
> work for me because I have an NFS rootfs).
> 
> Best regards,
> Liviu
> 

Thanks,
Joao
