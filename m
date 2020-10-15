From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:43:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongrel2: bump to version 1.12.2
In-Reply-To: <20200907214155.842865-1-fontaine.fabrice@gmail.com>
References: <20200907214155.842865-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015234324.40152794@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 23:41:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Refresh second patch
> - Drop third patch (already in version)
> - An external mbedtls can be used since version 1.12.0 and
>   https://github.com/mongrel2/mongrel2/commit/5be7fc9c90fd5c8caa233770b7e2cdff67b4bae2
>   so use it with an upstream patch and drop
>   MONGREL2_POST_CONFIGURE_HOOKS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Fix-Makefiles-for-cross-compilation.patch |  41 ++++---
>  ...03-Rename-symbol-to-prevent-conflict.patch |  45 -------
>  ...tion-error-when-building-with-gcc10.patch} |   0
>  .../0004-Support-urandom-inside-chroot.patch  | 113 ++++++++++++++++++
>  package/mongrel2/Config.in                    |   1 +
>  package/mongrel2/mongrel2.hash                |   5 +-
>  package/mongrel2/mongrel2.mk                  |  21 +---
>  7 files changed, 143 insertions(+), 83 deletions(-)
>  delete mode 100644 package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
>  rename package/mongrel2/{0004-fix-multiple-definition-error-when-building-with-gcc10.patch => 0003-fix-multiple-definition-error-when-building-with-gcc10.patch} (100%)
>  create mode 100644 package/mongrel2/0004-Support-urandom-inside-chroot.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
