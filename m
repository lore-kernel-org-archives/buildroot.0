From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Mon, 13 Jun 2016 16:55:07 +0000
Subject: [Buildroot] [PATCH 1/2] juno: Adding support for Juno r2
In-Reply-To: <20160609220352.5586fe0b@free-electrons.com>
References: <cover.1465468621.git.jpinto@synopsys.com>
 <01f8f69ba500ed01970fb600c6c5ae168669c88d.1465468621.git.jpinto@synopsys.com>
 <20160609220352.5586fe0b@free-electrons.com>
Message-ID: <6C7E76B729B341419CE4B84926C1D2CD011D32CD@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas.

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Thursday, June 09, 2016 9:04 PM
To: Joao Pinto <Joao.Pinto@synopsys.com>
Cc: buildroot at buildroot.org; Liviu.Dudau at arm.com; CARLOS.PALMINHA at synopsys.com
Subject: Re: [Buildroot] [PATCH 1/2] juno: Adding support for Juno r2

Hello,

The title should have been:

	configs/arm_juno: add support for Juno r2

On Thu,  9 Jun 2016 11:40:30 +0100, Joao Pinto wrote:
> Add support for Juno r2.

This part is not needed, as it only repeats the commit title with no other additional information.

>  Preparing your rootfs
> @@ -89,6 +91,19 @@ NOR3LOAD: 00000000               ;Image Load Address
>  NOR3ENTRY: 00000000              ;Image Entry Point
>  ......
>  
> +Configure *.dtb in the boot configuration for Juno r1

I guess you meant r2 here.

Applied with those issues fixed.

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
