From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:04:58 +0200
Subject: [Buildroot] [PATCH v2,1/1] minizip: bump to version 2.5.3
In-Reply-To: <20180923121142.3204-1-fontaine.fabrice@gmail.com>
References: <20180923121142.3204-1-fontaine.fabrice@gmail.com>
Message-ID: <20180925230458.69b7a165@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 14:11:42 +0200, Fabrice Fontaine wrote:
> - Move to cmake infrastructure
> - Do not enforce zlib dependency
> - Add optional bzip2 dependency
> - Add mandatory host-pkgconf and libbsd dependency
> - Remove miniunzip from Config.in, miniunzip (miniunz) has been merged
>   with minizip:
>   https://github.com/nmoinvaz/minizip/commit/a66cc31fac61e47a34bced08569ddec38b81bbef
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Remove zlib select as it is now an optional dependency
>  - Replace --enable-demos by -DBUILD_TEST=ON and remove miniunzip from
>    Config .in 

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
