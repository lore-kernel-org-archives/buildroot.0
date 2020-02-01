From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 23:11:21 +0100
Subject: [Buildroot] [PATCH] package/php: bump version to 7.4.2
In-Reply-To: <20200131090955.7948-1-p.debruijn@unilogic.nl>
References: <20200131090955.7948-1-p.debruijn@unilogic.nl>
Message-ID: <20200201231121.0caae89a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jan 2020 10:09:55 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> patch 0005 has been sourced from upstream,
> and can be dropped when 7.4.3 is released.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  .../0001-acinclude.m4-don-t-unset-variables.patch  | 18 ++---
>  package/php/0002-iconv-tweak-iconv-detection.patch | 20 ++---
>  .../php/0003-configure-disable-the-phar-tool.patch |  4 +-
>  .../php/0004-Call-apxs-with-correct-prefix.patch   |  6 +-
>  ...ompilation-failure-due-to-size_t-typecast.patch | 46 +++++++++++
>  ...nfig0.m4-add-ac_cv_have_pcre2_jit-variabl.patch | 91 ----------------------
>  package/php/Config.ext                             |  1 +
>  package/php/php.hash                               |  5 +-
>  package/php/php.mk                                 | 10 ++-
>  9 files changed, 81 insertions(+), 120 deletions(-)
>  create mode 100644 package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch
>  delete mode 100644 package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch

So Adam replied to me about the oniguruma dependency, and I updated the
commit log accordingly.

Also, you forgot to explain why the license file hash has changed, so I
extended the commit log.

Generally, I would recommend writing a bit more detailed commit logs,
to cover the different aspects of the patch.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
