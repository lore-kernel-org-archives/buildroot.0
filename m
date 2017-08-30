From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:19:38 +0200
Subject: [Buildroot] [PATCH] package: Drop simicsfs support
In-Reply-To: <1504108525-27529-1-git-send-email-bmeng.cn@gmail.com>
References: <1504108525-27529-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <20170830221938.2b4423ba@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 08:55:25 -0700, Bin Meng wrote:
> At present buildroot integrated simicfs v1.18 package is quite out
> of date, and does not compile with latest Linux kernel v4.12+. The
> latest package v1.22 supports recent kernels, however that is not
> public available anymore like the older versions.
> 
> In fact Simics is now moving away from the simicsfs kernel module,
> as the kernel module has required too much maintenance work. Users
> should move to the new user mode Simics agent instead.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  Config.in.legacy               | 12 ++++++++++++
>  DEVELOPERS                     |  1 -
>  package/Config.in              |  1 -
>  package/simicsfs/Config.in     | 11 -----------
>  package/simicsfs/simicsfs.hash |  2 --
>  package/simicsfs/simicsfs.mk   | 13 -------------
>  6 files changed, 12 insertions(+), 28 deletions(-)
>  delete mode 100644 package/simicsfs/Config.in
>  delete mode 100644 package/simicsfs/simicsfs.hash
>  delete mode 100644 package/simicsfs/simicsfs.mk

Applied to master with some minor tweaks. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
