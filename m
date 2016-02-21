From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:31:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: add optional
 support for webp
In-Reply-To: <1456077450-26675-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456077450-26675-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221213108.4ba0ed33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:57:30 +0100, Bernd Kuhls wrote:
> When webp was compiled before, imagemagick will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/stream | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libMagickCore-6.Q16.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libMagickWand-6.Q16.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libjpeg.so.8]
>  0x0000000000000001 (NEEDED)             Shared library: [libwebp.so.5]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/imagemagick/imagemagick.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
