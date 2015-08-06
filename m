From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:01:35 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/x11r7/libepoxy: bump version
 to 1.3.1, fix OpenGL / EGL dependencies
In-Reply-To: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150806090135.21f7d8f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  1 Aug 2015 18:07:14 +0200, Bernd Kuhls wrote:
> libepoxy depends on egl, opengl is an optional dependency
> 
> Fixes
> http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e
> http://autobuild.buildroot.net/results/025/025a3d3b4d3dd4f496dcbf09f2dd279116250207
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you separate the libepoxy bump from the OpenGL/EGL dependency
fix? We're past -rc1, so I can apply fixes, but not version bumps.

Also, could you get back to Yann E. Morin who asked some questions
about this patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
