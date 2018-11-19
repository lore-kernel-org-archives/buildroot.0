From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:51:33 +0100
Subject: [Buildroot] [PATCH next] tpm2-tss: fix build without stack
 smashing protection (SSP)
In-Reply-To: <20181119022624.22729-1-casantos@datacom.com.br>
References: <20181119022624.22729-1-casantos@datacom.com.br>
Message-ID: <20181119215133.0240370f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Nov 2018 00:26:24 -0200, Carlos Santos wrote:
> Restore a configuration environment setup that was incorrectly removed
> along with the upgrade to version 2.1.0.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/44221140fb8e2ddcb7d624e657b92a59375c02dd
>   http://autobuild.buildroot.net/results/08b2a8a4bdd1c38703626a4fc37dab31dce98f49
>   http://autobuild.buildroot.net/results/e469b47a6c8f1e8812325fd2860345105052316c
>   http://autobuild.buildroot.net/results/f230fe6bbeb8b22d2b5b7cfb3f0ac4b3b936dc37
>   http://autobuild.buildroot.net/results/ceb824033888086f6dde22c66d5b5f692a253c7e
>   http://autobuild.buildroot.net/results/f863947a7384cb754706e6c346d222be59ad4136
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/tpm2-tss/tpm2-tss.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
