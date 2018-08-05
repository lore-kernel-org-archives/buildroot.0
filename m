From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 15:14:19 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: disable for static build
In-Reply-To: <20180627192150.7351-1-ps.report@gmx.net>
References: <20180627192150.7351-1-ps.report@gmx.net>
Message-ID: <20180805151419.47c61526@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jun 2018 21:21:50 +0200, Peter Seiderer wrote:
> Static build of the wiringPi package is disabled by the tool author
> (see wiringPi/noMoreStatic for details) since the version bump
> to 2.46.
> 
> Fixes [1]:
> 
>   arm-linux-gcc.br_real: error: ../wiringPi/libwiringPi.a: No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/a1ca953247475a5f31fe9283ade05c9cba26853b
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/wiringpi/Config.in   |  5 +++--
>  package/wiringpi/wiringpi.mk | 28 +++++++---------------------
>  2 files changed, 10 insertions(+), 23 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
