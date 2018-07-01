From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 21:08:27 +0200
Subject: [Buildroot] [PATCH v2,1/1] boost: filesystem needs system
In-Reply-To: <20180701135240.28152-1-fontaine.fabrice@gmail.com>
References: <20180701135240.28152-1-fontaine.fabrice@gmail.com>
Message-ID: <20180701210827.5c9e617c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 15:52:40 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_filesystem.so
> 
> Dynamic section at offset 0x17f00 contains 28 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Don't cut command output

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
