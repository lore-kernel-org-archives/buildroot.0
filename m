From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 12:10:03 +0100
Subject: [Buildroot] [PATCH 1/3] lm-sensors: remove redundant
 BUILD_STATIC_LIB build parameter
In-Reply-To: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
References: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
Message-ID: <20181228121003.7c0dfd2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 12:13:46 +0200, Baruch Siach wrote:
> Commit 3e05efd76636 ("package/lm-sensors: disable static library for
> shared-only build") added BUILD_STATIC_LIB to LM_SENSORS_MAKE_OPTS with
> value that depends on BR2_SHARED_LIBS, but forgot to remove it from the
> common LM_SENSORS_MAKE_OPTS. Fix that.
> 
> Cc: Romain Naour <romain.naour@openwide.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lm-sensors/lm-sensors.mk | 1 -
>  1 file changed, 1 deletion(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
