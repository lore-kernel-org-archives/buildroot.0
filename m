From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:08:39 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: Add level 2
 optimization option
In-Reply-To: <20181203175430.24360-1-Evgeniy.Didin@synopsys.com>
References: <20181203175430.24360-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20181203220839.7b02c17d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 20:54:30 +0300, Evgeniy Didin wrote:
> Currently all random defconfigs which are used in autobuilder 
> use size optimizaion(-Os).
> Adding "-O2" optimization will give better test coverage.
> In many cases software gets built with speed optimization rather 
> than size optimization. So let's add Level 2 optimizaion option 
> to be genertated in random defconfigs, so we could be able to test
> how packages are built with "-O2" in autobuilder.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  utils/genrandconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
