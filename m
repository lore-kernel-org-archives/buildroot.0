From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 12:25:42 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
In-Reply-To: <1274422785.5719.8.camel@bernd-desktop>
References: <1274422785.5719.8.camel@bernd-desktop>
Message-ID: <20100521122542.5c4b0907@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 08:19:45 +0200
Thomas <tokant@gmx.net> wrote:

> I tried buildroot-2010.05-rc2:
> make at91rm9200df_defconfig
> make menuconfig
> make

I just tried this, at the build of binutils (and the complete
toolchain) works. The whole build process fails later while compiling
U-Boot, but this is another issue.

Could you post the full build log somewhere, with the build restarted
from scratch (rm -rf output/ before running make) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
