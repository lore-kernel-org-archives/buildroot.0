From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 13:53:14 +0200
Subject: [Buildroot] [PATCH 1/1] boost: test needs system and timer
In-Reply-To: <20180701191712.11103-1-fontaine.fabrice@gmail.com>
References: <20180701191712.11103-1-fontaine.fabrice@gmail.com>
Message-ID: <20180702135314.36966cb3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 21:17:12 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_prg_exec_monitor.so
> 
> Dynamic section at offset 0xdef8 contains 29 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_timer.so.1.67.0]
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
