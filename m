From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 10:53:47 +0200
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.26
In-Reply-To: <1466305115-29211-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466305115-29211-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160619105347.568309fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Jun 2016 23:58:35 -0300, Gustavo Zacarias wrote:
> Drop upstream patch, and now uses 64 bit sync built-ins for atomics.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../memcached/0001-fix-build-with-musl-libc.patch  | 78 ----------------------
>  package/memcached/Config.in                        |  2 +
>  package/memcached/memcached.hash                   |  6 +-
>  package/memcached/memcached.mk                     |  2 +-
>  4 files changed, 6 insertions(+), 82 deletions(-)
>  delete mode 100644 package/memcached/0001-fix-build-with-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
