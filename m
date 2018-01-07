From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:06:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.1.13
In-Reply-To: <20180106183657.20579-1-bernd.kuhls@t-online.de>
References: <20180106183657.20579-1-bernd.kuhls@t-online.de>
Message-ID: <20180107150624.69f3c5ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Jan 2018 19:36:57 +0100, Bernd Kuhls wrote:
> Removed 0008-fix-asm-constraints-in-aarch64-multiply-macro.patch, patch
> was applied upstream:
> https://github.com/php/php-src/commit/d6d4f2a9b38cd7fa7e938142e49e5a514d612e52
> 
> Renumbered patch 0009.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ch => 0008-Call-apxs-with-correct-prefix.patch} |  0
>  ...asm-constraints-in-aarch64-multiply-macro.patch | 28 ----------------------
>  package/php/php.hash                               |  2 +-
>  package/php/php.mk                                 |  2 +-
>  4 files changed, 2 insertions(+), 30 deletions(-)
>  rename package/php/{0009-Call-apxs-with-correct-prefix.patch => 0008-Call-apxs-with-correct-prefix.patch} (100%)
>  delete mode 100644 package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch

I adjusted the commit title to indicate it's a security bump, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
