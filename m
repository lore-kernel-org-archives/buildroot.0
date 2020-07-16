From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:23:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender/mender.mk: add missing
 backslash
In-Reply-To: <20200715231916.1617588-1-aduskett@gmail.com>
References: <20200715231916.1617588-1-aduskett@gmail.com>
Message-ID: <20200716092302.0d2460f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 16:19:16 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Without this backslash, any attempt to run make will result in the error:
> package/mender/mender.mk:44: *** recipe commences before first target.  Stop
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/mender/mender.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
