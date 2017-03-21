From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:11:30 +0100
Subject: [Buildroot] [PATCH] graph-depends: rename pkgutil.py to
 brpkgutil.py
In-Reply-To: <20170321082233.14868-1-yegorslists@googlemail.com>
References: <20170321082233.14868-1-yegorslists@googlemail.com>
Message-ID: <20170321231130.5aaa9801@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 09:22:33 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> pkgutil.py is also part of Python itself. Placing pkgutil.py as is
> in a folder with other scripts that require original pkgutil will
> break them. This is the case with scanpypi. So rename pkgutil.py
> to brpkgutil.py to avoid naming collision.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=9766
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  support/scripts/{pkgutil.py => brpkgutil.py} | 0
>  support/scripts/graph-depends                | 8 ++++----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename support/scripts/{pkgutil.py => brpkgutil.py} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
