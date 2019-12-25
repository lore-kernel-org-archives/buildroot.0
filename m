From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:12:46 +0100
Subject: [Buildroot] [PATCH] package/libnss: remove check against
 GCC_AT_LEAST_4_8
In-Reply-To: <20191216161415.25869-1-giulio.benetti@benettiengineering.com>
References: <20191216161415.25869-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191225231246.13e34ab5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 17:14:15 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> NSS_ENABLE_WERROR=0 is already added by default to LIBNSS_BUILD_VARS
> previously, so let's remove this check and set.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> This patch must be applied after this series:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=148093
> ---
>  package/libnss/libnss.mk | 6 ------
>  1 file changed, 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
