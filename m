From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:42:43 +0200
Subject: [Buildroot] [PATCH v3 04/13] package/libblockdev: add support
 for crypto plugin
In-Reply-To: <20200725230618.3640682-5-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
 <20200725230618.3640682-5-aduskett@gmail.com>
Message-ID: <20200829214243.219608e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 16:06:09 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Only depend on and select the cryptsetup package.
>     The volume-key and libnss packages are only necessary if --with-escrow is
>     passed as a conf opt.

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
