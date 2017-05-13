From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:04:51 +0200
Subject: [Buildroot] [PATCH] package: tmux: bump to v2.4
In-Reply-To: <20170512165943.13617-1-mrugiero@gmail.com>
References: <20170512165943.13617-1-mrugiero@gmail.com>
Message-ID: <20170513150451.18bcb87e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 13:59:43 -0300, Mario J. Rugiero wrote:
> Also removes 0001-compat-don-t-re-define-program_invocation_short_name.patch,
> since it's applied to upstream in this version.
> 
> Tested with:
> qemu_ppc_g3beige_defconfig
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---
>  ...t-re-define-program_invocation_short_name.patch | 42 ----------------------
>  package/tmux/tmux.hash                             |  2 +-
>  package/tmux/tmux.mk                               |  2 +-
>  3 files changed, 2 insertions(+), 44 deletions(-)
>  delete mode 100644 package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch

Applied to next, thanks. However, not that the commit title should have
been:

	package/tmux: bump to v2.4

or:

	tmux: bump to v2.4

We don't use "package: tmux: " as a prefix.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
