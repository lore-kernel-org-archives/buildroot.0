From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:23:16 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/x11r7/libepoxy: fix OpenGL /
 EGL dependencies
In-Reply-To: <1439037798-30471-2-git-send-email-bernd.kuhls@t-online.de>
References: <1439037798-30471-1-git-send-email-bernd.kuhls@t-online.de>
 <1439037798-30471-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150809112316.1068e288@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  8 Aug 2015 14:43:18 +0200, Bernd Kuhls wrote:
> libepoxy depends on egl, opengl is an optional dependency
> 
> Fixes
> http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e
> http://autobuild.buildroot.net/results/025/025a3d3b4d3dd4f496dcbf09f2dd279116250207
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: Fix CFLAGS and SoB (Thomas)
> v4: split opengl/egl fix from version bump (Thomas)
> v3: bumped to v1.3.1, switched to pkgconf for rpi support
> v2: Add missing select lines to Config.in (Thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
