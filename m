From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:29:18 +0100
Subject: [Buildroot] [PATCH 04/10] package/mediastreamer: add optional
 support for libupnp
In-Reply-To: <1456076099-19607-4-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
 <1456076099-19607-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221212918.606f0917@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:34:53 +0100, Bernd Kuhls wrote:
> When libupnp was compiled before, mediastreamer will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libmediastreamer_voip.so.3.0.0 | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libmediastreamer_base.so.3]
>  0x0000000000000001 (NEEDED)             Shared library: [libupnp.so.6]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mediastreamer/mediastreamer.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Patches 4 to 10 applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
