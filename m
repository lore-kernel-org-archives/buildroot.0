From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:05:58 +0200
Subject: [Buildroot] [PATCH/next] package/dvdauthor: bump version to
 0.7.2
In-Reply-To: <20170528103334.30361-1-bernd.kuhls@t-online.de>
References: <20170528103334.30361-1-bernd.kuhls@t-online.de>
Message-ID: <20170528150558.0b2d1e65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 12:33:34 +0200, Bernd Kuhls wrote:
> Changed _SITE to https, added upstream hashes.
> 
> Removed patch applied upstream:
> https://github.com/ldo/dvdauthor/commit/176172d5dcba4d6e2704a1a2cc48c9e687761996
> 
> Also remove autoreconf-related code, basically reverting the original
> commit:
> https://git.buildroot.net/buildroot/commit/package/dvdauthor?id=1cac78fbb044279f1854b1c7c59e94f03fb061f1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-configure.ac-fix-static-build.patch       | 55 ----------------------
>  package/dvdauthor/dvdauthor.hash                   |  5 +-
>  package/dvdauthor/dvdauthor.mk                     |  9 +---
>  3 files changed, 6 insertions(+), 63 deletions(-)
>  delete mode 100644 package/dvdauthor/0001-configure.ac-fix-static-build.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
