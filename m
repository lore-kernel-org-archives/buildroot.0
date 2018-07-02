From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 13:53:11 +0200
Subject: [Buildroot] [PATCH 1/1] boost: timer needs chrono and system
In-Reply-To: <20180701191644.11050-1-fontaine.fabrice@gmail.com>
References: <20180701191644.11050-1-fontaine.fabrice@gmail.com>
Message-ID: <20180702135311.0a1a4793@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 21:16:44 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_timer.so
> 
> Dynamic section at offset 0x5ef8 contains 29 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
