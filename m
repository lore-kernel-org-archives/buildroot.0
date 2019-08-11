From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 15:39:46 +0200
Subject: [Buildroot] [PATCH v2 2/5] autobuild-run: make prepare_build()
 clean the output directory used for reproducibility testing
In-Reply-To: <20190810035902.14047-2-itsatharva@gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
 <20190810035902.14047-2-itsatharva@gmail.com>
Message-ID: <20190811153946.58efabcd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Aug 2019 09:28:59 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> The previous patch introduced a new output directory for the second build in a
> reproducibile build test. This patch will make sure that it is cleaned before
> the subsequent build process begins.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
