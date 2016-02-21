From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:23:41 +0100
Subject: [Buildroot] [PATCH 2/7] package/gstreamer1/gst1-plugins-good:
 add optional support for libv4l
In-Reply-To: <1456066125-28379-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
 <1456066125-28379-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182341.62c2cb8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 15:48:40 +0100, Bernd Kuhls wrote:
> When libv4l was compiled before, gst1-plugins-good will use it as
> optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/gstreamer-1.0/libgstvideo4linux2.so | grep NEEDED | sort
> [...]
>  0x0000000000000001 (NEEDED)             Shared library: [libv4l2.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
