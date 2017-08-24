From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:21:13 +0200
Subject: [Buildroot] [PATCH 2/2] util-linux: use a patch from upstream
 to fix ncursesw support
In-Reply-To: <20170824035838.14466-2-casantos@datacom.ind.br>
References: <20170823154252.03f70fea@windsurf>
 <20170824035838.14466-1-casantos@datacom.ind.br>
 <20170824035838.14466-2-casantos@datacom.ind.br>
Message-ID: <20170824232113.474c52b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Aug 2017 00:58:38 -0300, Carlos Santos wrote:
> This patch is much smaller the the previous one and will unlikely cause
> a conflict with some forthcoming 2.30.x release.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...-Revert-build-sys-ncurses-headers-cleanup.patch | 191 ---------------------
>  ...upport-ncursesw-without-headers-in-ncurse.patch |  58 +++++++
>  2 files changed, 58 insertions(+), 191 deletions(-)
>  delete mode 100644 package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
>  create mode 100644 package/util-linux/0001-build-sys-support-ncursesw-without-headers-in-ncurse.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
