From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 May 2014 18:57:52 +0200
Subject: [Buildroot] buildroot-2014.05-rc3 and spl file
In-Reply-To: <20140529082417.5475b95e34d3321dbc2d2aab@lavabit.com>
References: <20140529082417.5475b95e34d3321dbc2d2aab@lavabit.com>
Message-ID: <20140529185752.6a53e895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear rh_,

On Thu, 29 May 2014 08:24:17 -0700, rh_ wrote:

> cp -dpf /buildroot-2014.05-rc3/output/build/uboot-2014.04/"u-boot-spl.bin" /buildroot-2014.05-rc3/output/images/
> cp: cannot stat ?/buildroot-2014.05-rc3/output/build/uboot-2014.04/u-boot-spl.bin?: No such file or directory
> make: *** [/buildroot-2014.05-rc3/output/build/uboot-2014.04/.stamp_images_installed] Error 1
> 
> The file's in:
> /buildroot-2014.05-rc3/output/build/uboot-2014.04/spl/"u-boot-spl.bin"
> 
> Note the addition of the "spl" directory in uboot-2014.04.

Thanks for the report. Is the fact that the u-boot-spl.bin is generated
in spl/ something new in U-Boot 2014.04 ? Something specific to a given
board configuration ?

We need to understand this in order to make a patch that will not break
other situations.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
