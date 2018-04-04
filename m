From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 18:03:08 +0200
Subject: [Buildroot] [PATCH] libkrb5: disable optional tcl support
In-Reply-To: <a0b74eef15ffe6a08bfe1182ab429214799ffcd1.1522828746.git.baruch@tkos.co.il>
References: <a0b74eef15ffe6a08bfe1182ab429214799ffcd1.1522828746.git.baruch@tkos.co.il>
Message-ID: <20180404180308.63d17d37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 10:59:06 +0300, Baruch Siach wrote:
> Avoid detection of host tcl headers.
> 
> The tcl package in Buildroot is not cross-compile safe. The generated
> tclConfig.sh script has -L/usr/lib in TCL_LIB_SPEC.
> 
> Should fix:
> http://autobuild.buildroot.net/results/d11/d118c3c09f6fc1de26491f2ed480ef28b091dba8/
> http://autobuild.buildroot.net/results/035/0353e1443125da1e544d1a98348716bfe67c8726/
> 
> Cc: Andr? Hentschel <nerv@dawncrow.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libkrb5/libkrb5.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
