From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:45:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: fix ARC failure to build
 in 2 phases.
In-Reply-To: <1435848294-5891-1-git-send-email-talz@ezchip.com>
References: <1435848294-5891-1-git-send-email-talz@ezchip.com>
Message-ID: <20150702234504.20c1d300@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Zilcer,

On Thu, 2 Jul 2015 17:44:54 +0300, Tal Zilcer wrote:
> From: Tal Zilcer <talz@ezchip.com>
> 
> When working with GCC initial at override source dir mode the
> HOST_GCC_INITIAL_POST_PATCH_HOOKS is not called and compilation failes.
> The solution is to use HOST_GCC_INITIAL_POST_RSYNC_HOOKS since this hook
> is being called at override source dir mode.
> 
> Signed-off-by: Tal Zilcer <talz@ezchip.com>
> ---
>  package/gcc/gcc-initial/gcc-initial.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
