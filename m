From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2016 09:22:00 +0200
Subject: [Buildroot] [PATCH] kexec: fix build for arm
In-Reply-To: <73d400d1c401d240e0f37e41a68ea095f10975bb.1477032888.git.baruch@tkos.co.il>
References: <73d400d1c401d240e0f37e41a68ea095f10975bb.1477032888.git.baruch@tkos.co.il>
Message-ID: <20161021092200.750c33de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 09:54:48 +0300, Baruch Siach wrote:
> Add a patch equivalent to upstream commit 1574ff1aae4 (arm: include
> phys_to_virt.h and iomem.h in distribution).
> 
> Fixes:
> http://autobuild.buildroot.net/results/bf9/bf939477cce6a5c333ee579006b9aa4856acd604/
> http://autobuild.buildroot.net/results/8a7/8a7407afcf47326aadbce0b9157442dae9558ded/
> http://autobuild.buildroot.net/results/ec2/ec26f1dd97f1e861e401d2709a243ae55bd6f022/
> 
> Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0002-arm-add-phys_to_virt.h-and-iomem.patch    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
