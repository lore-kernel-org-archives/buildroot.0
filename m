From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 19:01:42 +0200
Subject: [Buildroot] [PATCH 3/3 v2] package/nvidia-driver: build the
 kernel module
In-Reply-To: <1aff79ec2bb8dc545496e965aa1fae0756be29ce.1411334346.git.yann.morin.1998@free.fr>
References: <cover.1411334346.git.yann.morin.1998@free.fr>
 <1aff79ec2bb8dc545496e965aa1fae0756be29ce.1411334346.git.yann.morin.1998@free.fr>
Message-ID: <20141005190142.73fb29dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 21 Sep 2014 23:22:56 +0200, Yann E. MORIN wrote:
> Add option to build the nvidia.ko module. If CUDA is enabled, also build
> the nvidia-uvm.ko kernel module (for Unified Memory access), which is
> required by the CUDA user-land library.
> 
> Substancially inspired by the corresponding Gentoo ebuild:
>     http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-drivers/nvidia-drivers/nvidia-drivers-340.32.ebuild?revision=1.2&view=markup
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nvidia-driver/Config.in        | 13 +++++++++
>  package/nvidia-driver/nvidia-driver.mk | 49 ++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)

This one looks fine to me, so:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
