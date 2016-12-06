From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 21:13:09 +0100
Subject: [Buildroot] [PATCH] toolchain-external: disallow sourcery
 codebench ARM toolchain for ARMv8 cores
In-Reply-To: <20161206164218.4488-1-peter@korsgaard.com>
References: <20161206164218.4488-1-peter@korsgaard.com>
Message-ID: <20161206211309.65d8249b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 17:42:18 +0100, Peter Korsgaard wrote:
> This toolchain uses GCC 4.8.x, which doesn't support the ARMv8 cores.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
