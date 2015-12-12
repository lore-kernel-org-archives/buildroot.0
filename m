From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 13:50:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump to version 0.99
In-Reply-To: <1449359915-18919-2-git-send-email-bernd.kuhls@t-online.de>
References: <1449359915-18919-1-git-send-email-bernd.kuhls@t-online.de>
 <1449359915-18919-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151212135058.254bbdd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  6 Dec 2015 00:58:35 +0100, Bernd Kuhls wrote:
> - removed autoreconf and two patches applied upstream
> https://github.com/vrtadmin/clamav-devel/commit/b20eeffadb7675bf1a74e35b0aef80e26e1c0462
> https://github.com/vrtadmin/clamav-devel/commit/785e4a90e0b5bf60f55eb0987300da2e1e12abbb
> 
> - removed clamuko configure option
> - disabled fanotify support because UCLIBC_HAS_FTS is disabled
> https://github.com/vrtadmin/clamav-devel/blob/master/README
> "Support for on-access scanning using Clamuko/Dazuko has been replaced
>  with fanotify."
> 
> - added host-pkgconf dependency, used by configure
> - added optional dependency to pcre
> - added sha256 hash
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/0002-static-linking.patch   | 58 ------------------------------
>  package/clamav/0004-fix-static-build.patch | 21 -----------
>  package/clamav/clamav.hash                 |  6 ++--
>  package/clamav/clamav.mk                   | 20 ++++++++---
>  4 files changed, 19 insertions(+), 86 deletions(-)
>  delete mode 100644 package/clamav/0002-static-linking.patch
>  delete mode 100644 package/clamav/0004-fix-static-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
