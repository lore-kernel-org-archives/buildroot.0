From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:57:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdvdnav: fix build with
 gcc-4.8
In-Reply-To: <20200417165514.18540-1-bernd.kuhls@t-online.de>
References: <20200417165514.18540-1-bernd.kuhls@t-online.de>
Message-ID: <20200418145725.4f161346@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 18:55:14 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/c95/c9514368b98bc3a7f7ab92cb33c54bd3ffd9a232/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdvdnav/libdvdnav.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
