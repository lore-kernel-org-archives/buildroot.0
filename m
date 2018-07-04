From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:31:55 +0200
Subject: [Buildroot] [PATCH 1/1] boost: coroutine needs chrono, system,
 thread
In-Reply-To: <20180703222430.14800-1-fontaine.fabrice@gmail.com>
References: <20180703222430.14800-1-fontaine.fabrice@gmail.com>
Message-ID: <20180704223155.2b99c7b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 00:24:30 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_coroutine.so
> 
> Dynamic section at offset 0xdee8 contains 31 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_context.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
