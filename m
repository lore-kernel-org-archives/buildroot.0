From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 21:49:21 +0100
Subject: [Buildroot] [PATCH] zsh: don't use host pcre-config
In-Reply-To: <0f3d133b0082f11b75b9fad170d1b81211352dd6.1457041570.git.baruch@tkos.co.il>
References: <0f3d133b0082f11b75b9fad170d1b81211352dd6.1457041570.git.baruch@tkos.co.il>
Message-ID: <20160306214921.50440718@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu,  3 Mar 2016 23:46:10 +0200, Baruch Siach wrote:
> Commit 5e05faec7b4 (zsh: use the correct target pcre-config) set
> ac_cv_prog_PCRECONF to the location of staging pcre-config. Unfortunately zsh
> configure script does not actually use this variable when running pcre-config.
> Complete the fix with a patch that makes use of ac_cv_prog_PCRECONF.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-configure-use-user-set-pcre-config.patch  | 33 ++++++++++++++++++++++
>  package/zsh/zsh.mk                                 |  2 ++
>  2 files changed, 35 insertions(+)
>  create mode 100644 package/zsh/0001-configure-use-user-set-pcre-config.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
