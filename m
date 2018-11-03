From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:57:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-geode:
 add upstream commits to fix build errors
In-Reply-To: <20181103142856.11664-1-bernd.kuhls@t-online.de>
References: <20181103142856.11664-1-bernd.kuhls@t-online.de>
Message-ID: <20181103155718.7691e18f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 15:28:56 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/a9b/a9baf6ecf147f336021edda20bb091b8aa071209/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Remove-call-to-LoaderGetOS.patch     | 53 +++++++++++++++++++
>  ...ANDR-initialization-for-xserver-1.20.patch | 35 ++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
