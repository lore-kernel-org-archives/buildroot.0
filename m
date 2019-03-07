From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:47:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/mender: Fix service file.
In-Reply-To: <20190306154953.119334-1-aduskett@gmail.com>
References: <20190306154953.119334-1-aduskett@gmail.com>
Message-ID: <20190307214746.19af3c2e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Mar 2019 10:49:53 -0500
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> There was a missing double quotes that would prevent the service from starting.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/mender/mender.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
