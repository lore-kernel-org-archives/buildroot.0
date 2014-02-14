From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 15:29:48 +0100
Subject: [Buildroot] [PATCH 1/1] Qt5: update to 5.2.1
In-Reply-To: <1392387539-20142-1-git-send-email-syntheticpp@gmx.net>
References: <1392387539-20142-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20140214152948.424fd251@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

On Fri, 14 Feb 2014 15:18:59 +0100, Peter K?mmel wrote:
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  package/qt5/qt5.mk                                 |   2 +-
>  .../qt5base-0001-Fix-build-MIPS64-bigendian.patch  |  51 -------
>  ...-detect-posix_fallocate-at-configure-time.patch | 167 ---------------------
>  ...kit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch |  35 -----
>  4 files changed, 1 insertion(+), 254 deletions(-)

When bumping a package, if some patches are removed, please explain in
the commit log why they are removed. In this case, it would be good to
mention that they can all be removed because they have been merged
upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
