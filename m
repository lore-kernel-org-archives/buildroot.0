From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 23:07:23 +0100
Subject: [Buildroot] [PATCH v5 0/1] package/guile: New package
In-Reply-To: <1416770449-4246-1-git-send-email-paguilar@paguilar.org>
References: <1416770449-4246-1-git-send-email-paguilar@paguilar.org>
Message-ID: <20141123220723.GK11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-23 20:20 +0100, Pedro Aguilar spake thusly:
> This patch fixes the suggestion made by Yann Morin in 
> guile:
> 
> Add "depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc"
> Break long line GUILE_CFLAGS to improve readability
> 
> Pedro Aguilar (1):
>   guile: new package

As far as I can see, your previous patches were not applied. In that
case, you should resend the full series.

This is so that when looking for patches to apply, we are not confused
by a missing dependency.

For example, this patch alone is not enough, because it depends on other
packages that are not yet present in the tree.

Care to sesend the full series, please?

Thanks for working on this! :-)

Regards,
Yann E. MORIN.

>  package/Config.in                                  |  1 +
>  package/guile/Config.in                            | 17 ++++++++++
>  package/guile/guile-01-fix_arm_endianness.patch    | 25 +++++++++++++++
>  .../guile/guile-02-calculate-csqrt_manually.patch  | 16 ++++++++++
>  package/guile/guile-03-remove_unused_funcs.patch   | 36 ++++++++++++++++++++++
>  package/guile/guile.mk                             | 31 +++++++++++++++++++
>  6 files changed, 126 insertions(+)
>  create mode 100644 package/guile/Config.in
>  create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
>  create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
>  create mode 100644 package/guile/guile-03-remove_unused_funcs.patch
>  create mode 100644 package/guile/guile.mk
> 
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
