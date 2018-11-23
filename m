From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:47:14 +0100
Subject: [Buildroot] [PATCH next] util-linux: fix build for SPARC
In-Reply-To: <20181122115930.21278-1-casantos@datacom.com.br>
References: <20181122115930.21278-1-casantos@datacom.com.br>
Message-ID: <20181123104714.7300215f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 09:59:30 -0200, Carlos Santos wrote:
> Pull a patch already applied upstream that fixes the build of setarch
> for SPARC processors.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/44d0538332499cea691a381048562a09cda23624
>   http://autobuild.buildroot.net/results/e7e3469717ab27d66d2528087fd7c3a41477ae05
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  ...-setarch-fix-obscure-sparc32bash-use-case.patch | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 package/util-linux/0003-setarch-fix-obscure-sparc32bash-use-case.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
