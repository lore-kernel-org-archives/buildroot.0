From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:30:31 +0200
Subject: [Buildroot] [PATCH 2/4] package/mender/mender.mk: fix linker
 version argument
In-Reply-To: <20210320222835.3951325-3-aduskett@gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-3-aduskett@gmail.com>
Message-ID: <20210330223031.77a16e53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 15:28:33 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@rivian.com>
> 
> The current linker flag "-X main.Version=$(MENDER_VERSION)" no longer points
> to the correct location, which results in "version: unknown" when runnning
> "mender -version." Update the linker flag to point to the correct location.
> 
> Signed-off-by: Adam Duskett <Aduskett@rivian.com>
> ---
>  package/mender/mender.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
