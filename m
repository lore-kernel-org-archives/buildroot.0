From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 00:06:48 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime2_defconfig:
 correct u-boot configuration
In-Reply-To: <20161221211621.8851-1-peter@korsgaard.com>
References: <20161221211621.8851-1-peter@korsgaard.com>
Message-ID: <20161223000648.3d5a9eb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Dec 2016 22:16:21 +0100, Peter Korsgaard wrote:
> This defconfig currently doesn't build:
> https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616951
> 
> As u-boot needs dtc, so add that and change to kconfig mode like on our
> other allwinner defconfigs as that is in fact what is used.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/olimex_a20_olinuxino_lime2_defconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
