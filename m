From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:34:22 +0200
Subject: [Buildroot] [PATCH] systemd: revert use of ln relative option.
In-Reply-To: <1396620214-26517-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396620214-26517-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140404233422.6b3d587b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri,  4 Apr 2014 16:03:34 +0200, Eric Le Bihan wrote:
> Systemd build system now uses the `--relative` option from `ln(1)`.
> This option was added to GNU coreutils 8.16, which is not widely
> deployed yet by GNU/Linux distributions (not available in Debian Wheezy
> for example).
> 
> Fixes: http://autobuild.buildroot.net/results/354/3546c003a8fcbb36ef5ba29c00a96e473b927ecb/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...uild-sys-revert-use-of-ln-relative-option.patch |  115 ++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
