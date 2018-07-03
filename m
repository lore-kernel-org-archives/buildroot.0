From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:44:19 +0200
Subject: [Buildroot] [PATCH 1/1] boost: locale needs system
In-Reply-To: <20180702212228.13835-1-fontaine.fabrice@gmail.com>
References: <20180702212228.13835-1-fontaine.fabrice@gmail.com>
Message-ID: <20180703214419.12a816da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jul 2018 23:22:28 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_locale.so
> 
> Dynamic section at offset 0x76ef4 contains 29 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
