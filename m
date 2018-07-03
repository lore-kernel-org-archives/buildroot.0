From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:44:08 +0200
Subject: [Buildroot] [PATCH 1/1] boost: add selects for wave
In-Reply-To: <20180702211845.13144-1-fontaine.fabrice@gmail.com>
References: <20180702211845.13144-1-fontaine.fabrice@gmail.com>
Message-ID: <20180703214408.070d8333@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jul 2018 23:18:45 +0200, Fabrice Fontaine wrote:
> wave needs filesystem, thread, date_time, chrono and system
> 
> output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_wave.so
> 
> Dynamic section at offset 0x143edc contains 32 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_filesystem.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_date_time.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
