From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:46:01 +0200
Subject: [Buildroot] [PATCH v2 1/2] Revert "package/ffmpeg: Fix i586
 compilation with gcc5"
In-Reply-To: <20170409130003.28289-1-bernd.kuhls@t-online.de>
References: <20170409130003.28289-1-bernd.kuhls@t-online.de>
Message-ID: <20170409154601.44368a5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Apr 2017 15:00:02 +0200, Bernd Kuhls wrote:
> This reverts commit bfb8df2ad9b164b421d25294c6882c8b61dc59a5.
> 
> With current toolchains it was not possible to trigger the bug anymore.
> 
> Tested with these settings:
> 
> BR2_i386=y
> BR2_x86_i586=y
> BR2_GCC_VERSION_4_8_X=y
> 
> BR2_i386=y
> BR2_x86_i586=y
> BR2_GCC_VERSION_5_X=y
> 
> BR2_i386=y
> BR2_x86_i586=y
> BR2_GCC_VERSION_6_X=y
> 
> Other x86 variants also work:
> 
> BR2_i386=y
> BR2_x86_i486=y
> BR2_GCC_VERSION_5_X=y
> 
> BR2_i386=y
> BR2_x86_i686=y
> BR2_GCC_VERSION_5_X=y
> 
> BR2_i386=y
> BR2_x86_pentium_mmx=y
> BR2_GCC_VERSION_5_X=y
> 
> BR2_i386=y
> BR2_x86_corei7=y
> BR2_GCC_VERSION_5_X=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: initial revision

Thanks a lot for the extended explanation on the second patch, and
taking the time to look at ffmpeg as well. Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
