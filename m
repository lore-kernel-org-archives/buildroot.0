From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:31:12 +0100
Subject: [Buildroot] [PATCH 1/2] ipset: drop obsolete patch
In-Reply-To: <4dccce88a1f69b1ce62739e89b050382df056626.1488742417.git.baruch@tkos.co.il>
References: <4dccce88a1f69b1ce62739e89b050382df056626.1488742417.git.baruch@tkos.co.il>
Message-ID: <20170305213112.5eb4dfa4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 21:33:36 +0200, Baruch Siach wrote:
> Since commit 0552a367dbd ("Remove --{enable, disable}-debug configure flags.")
> we do not pass --enable-debug to configure script. The patch to remove -Werror
> in this case is thus no longer needed.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...not-pass-Werror-when-enable-debug-is-used.patch | 39 ----------------------
>  package/ipset/ipset.mk                             |  2 --
>  2 files changed, 41 deletions(-)
>  delete mode 100644 package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
