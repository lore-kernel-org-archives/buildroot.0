From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Aug 2014 09:32:33 +0200
Subject: [Buildroot] [git commit branch/next] gdb: fixup host gdb tui
 option
In-Reply-To: <20140830072312.DBD5E9D577@busybox.osuosl.org>
References: <20140830072312.DBD5E9D577@busybox.osuosl.org>
Message-ID: <20140830093233.2f485eee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 30 Aug 2014 09:21:48 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=62387a8b11224a9c5320d42e2f0c4e2089d3452b
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next
> 
> Seems like I accidently picked v1 instead of v2 from patchwork.
> 
> BR2_PACKAGE_NCURSES is for ncurses on the target, not host.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gdb/Config.in.host |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 8846eaf..e48dc10 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -15,7 +15,6 @@ if BR2_PACKAGE_HOST_GDB
>  
>  config BR2_PACKAGE_HOST_GDB_TUI
>  	bool "GDB TUI support"
> -	select BR2_PACKAGE_NCURSES
>  	help
>  	  This option enables terminal user interface (TUI) for gdb

Ah, ok, seen that one now. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
