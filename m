From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:58:15 +0100
Subject: [Buildroot] trouble configuring for beaglebone black and
 external Linaro toolchain, 2015.02-rc2
In-Reply-To: <CAPALihMRa3w2S6t_xtq=0LwtPk4wn-GUVLGSUADz-n7kn3Ja1g@mail.gmail.com>
References: <CAPALihNuWHDrxf=RcinmAGcx-zchGh=--L209e__O7e+BRpT2w@mail.gmail.com>
 <20150221232708.19c7f576@free-electrons.com>
 <CAPALihMRa3w2S6t_xtq=0LwtPk4wn-GUVLGSUADz-n7kn3Ja1g@mail.gmail.com>
Message-ID: <20150221235815.5c781df1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Welch,

On Sat, 21 Feb 2015 16:31:21 -0600, William Welch wrote:

> /home/bwelch/svn/nm-plus/unfuddle/pluslocation_res/trunk/productionfs/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/4.9.2/cc1:
> error while loading shared libraries: libz.so.1: cannot open shared object
> file: No such file or directory

You need to install zlib1g:i386 on your system, i.e the 32 bits variant
of zlib.

And we should probably improve Buildroot a bit to check this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
