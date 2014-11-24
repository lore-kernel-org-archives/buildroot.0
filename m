From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:21:42 +0100
Subject: [Buildroot] [PATCH] uemacs: bump to latest LT master
In-Reply-To: <194ba09dbf60d59366091421eac61ee6accb1bdc.1416758897.git.baruch@tkos.co.il>
References: <194ba09dbf60d59366091421eac61ee6accb1bdc.1416758897.git.baruch@tkos.co.il>
Message-ID: <20141124222142.0d1811ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 23 Nov 2014 18:08:17 +0200, Baruch Siach wrote:
> Latest LT (Linus Torvalds) master fixes symbol collision with ncurses.
> 
> Drop patches 01 and 02 as they are not needed anymore.
> 
> Refresh patch 03 to account for context changes, and rename to new convention.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6e0/6e0fb4a74f62e23cbc56482ae25f9979fa6f14f8/
> http://autobuild.buildroot.net/results/df9/df9b693d7f53daba0d25f52132ca1594dd1273fa/
> http://autobuild.buildroot.net/results/b39/b39d3997466951df078a5f47c5a75200b07dca4c/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ixon.patch => 01-clear-ixon-termios-flag.patch} | 15 +++++-----
>  package/uemacs/uemacs-4.0.15-lt.01.patch           | 33 ----------------------
>  package/uemacs/uemacs-4.0.15-lt.02.patch           | 16 -----------
>  package/uemacs/uemacs.mk                           |  6 ++--
>  4 files changed, 11 insertions(+), 59 deletions(-)
>  rename package/uemacs/{uemacs-4.0.15-lt.03.ixon.patch => 01-clear-ixon-termios-flag.patch} (64%)
>  delete mode 100644 package/uemacs/uemacs-4.0.15-lt.01.patch
>  delete mode 100644 package/uemacs/uemacs-4.0.15-lt.02.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
