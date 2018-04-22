From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 14:43:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/pcsc-lite: bump version to
 1.8.23
In-Reply-To: <20180422115518.2353-1-bernd.kuhls@t-online.de>
References: <20180422115518.2353-1-bernd.kuhls@t-online.de>
Message-ID: <20180422144313.5b0a53fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Apr 2018 13:55:17 +0200, Bernd Kuhls wrote:
> Upstream moved to https://muscle.apdu.fr/ according to
> http://pcsclite.alioth.debian.org/, updated _SITE and Config.in.
> 
> Added license hash.
> 
> Added optional systemd support available since upstream commit
> https://github.com/LudovicRousseau/PCSC/commit/30e10951f81b9480e788965f89d0d4d0aee909c0#diff-67e997bcfdac55191033d57a16d1408a
> 
> We need to add systemd support in this patch because omitting it will
> cause an error during configure:
> 
> checking for LIBSYSTEMD... no
> configure: error: install libsystemd-dev or use --disable-libsystemd
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/pcsc-lite/Config.in      |  2 +-
>  package/pcsc-lite/pcsc-lite.hash |  3 ++-
>  package/pcsc-lite/pcsc-lite.mk   | 11 +++++++++--
>  3 files changed, 12 insertions(+), 4 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
