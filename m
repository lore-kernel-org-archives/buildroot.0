From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 08:56:22 +0100
Subject: [Buildroot] [PATCH] nftables: fix build with glibc before 2.19
In-Reply-To: <4fb69e5087a62872596d5a9bcab64b1417147e6a.1518180958.git.baruch@tkos.co.il>
References: <4fb69e5087a62872596d5a9bcab64b1417147e6a.1518180958.git.baruch@tkos.co.il>
Message-ID: <20180210085622.65c76bd0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Feb 2018 14:55:58 +0200, Baruch Siach wrote:
> Add a patch that has a local definition of IPPROTO_MH. This fixes build
> with glibc before 2.19 that missed IPPROTO_MH.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b0a/b0ab6c8c765977cfdc9791d768d3ec2cf129d25d/
> http://autobuild.buildroot.net/results/3ef/3ef36d9d03497ee1d5d20bd44aee6ccf12868f7b/
> http://autobuild.buildroot.net/results/445/445f2291ebba521f0faac961ca8868ae99b2d795/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-src-fix-build-with-older-glibc.patch      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/nftables/0001-src-fix-build-with-older-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
