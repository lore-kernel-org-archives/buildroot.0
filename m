From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 21:08:30 +0200
Subject: [Buildroot] [PATCH v2,1/1] boost: chrono needs system
In-Reply-To: <20180701140043.28829-1-fontaine.fabrice@gmail.com>
References: <20180701140043.28829-1-fontaine.fabrice@gmail.com>
Message-ID: <20180701210830.1e131512@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 16:00:43 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/mips-linux-gnu-readelf -d output/staging/usr/lib/libboost_chrono.so
> 
> Dynamic section at offset 0x2c0 contains 30 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000001 (NEEDED)             Shared library: [libboost_system.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Don't wrap line to 72 characters for command output

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
