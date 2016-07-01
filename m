From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:20:39 +0200
Subject: [Buildroot] [PATCH] tmux: bump to version 2.2
In-Reply-To: <20160620044611.14225-1-ricardo.martincoski@gmail.com>
References: <20160620044611.14225-1-ricardo.martincoski@gmail.com>
Message-ID: <20160701112039.27c1c6a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Jun 2016 01:46:11 -0300, Ricardo Martincoski wrote:
> - remove patch already upstream 0001-remove-use-of-sys-cdefs.h.patch
> https://github.com/tmux/tmux/commit/7b085136a7291cbcdfcc53182fbd13aaca70306e
> - add new dependency on BR2_USE_WCHAR (version 2.2 uses mbtowc())
> - add new dependency on locale support
> - add note to help text about the need of a working UTF-8 locale
> - also rewrap help text to 72 characters
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Some references about the UTF-8 thing:
> https://github.com/tmux/tmux/commit/0d6de44a37755f0e5046c04e19e4506a6d59e750
> https://github.com/tmux/tmux/commit/1f0b317088aaeb230d69f13f43ed63b7406c6fd1
> https://groups.google.com/forum/#!topic/tmux-users/BnMK0ijLSIE
> ---
>  package/tmux/0001-remove-use-of-sys-cdefs.h.patch | 42 -----------------------
>  package/tmux/Config.in                            | 13 +++++--
>  package/tmux/tmux.hash                            |  2 +-
>  package/tmux/tmux.mk                              |  2 +-
>  4 files changed, 13 insertions(+), 46 deletions(-)
>  delete mode 100644 package/tmux/0001-remove-use-of-sys-cdefs.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
