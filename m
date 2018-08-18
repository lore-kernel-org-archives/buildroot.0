From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 23:13:33 +0200
Subject: [Buildroot] [PATCH 1/7 v4] linux: explain why we need
 host-{flex, bison}
In-Reply-To: <625814ff31c1c985e01a6cf51f58b28811b3af71.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
 <625814ff31c1c985e01a6cf51f58b28811b3af71.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <20180818231333.252ad2c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 18:06:47 +0200, Yann E. MORIN wrote:
> The commit that added the dependency on host-{bison,flex} did
> so because the pre-generated kconfig parser source files were
> removed from the kernel tree, in linux-4.16.
> 
> But then, in linux-4.17, the pre-generated dtc parser source
> files were in turn removed as well.
> 
> So, document the two reasons why they are needed, so we don't
> accidentally remove them when we (soon) introduce the kconfig
> dependencies.
> 
> (Also fix the first assignment to LINUX_DEPENDENCIES to be a
> simple assignement, not an append-assignment.)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  linux/linux.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
