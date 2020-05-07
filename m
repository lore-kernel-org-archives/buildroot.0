From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:19:09 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.34
In-Reply-To: <20200506130451.zo4gk6g3h7udqcsp@waldemar-brodkorb.de>
References: <20200506130451.zo4gk6g3h7udqcsp@waldemar-brodkorb.de>
Message-ID: <20200507231909.2f4ba25f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 6 May 2020 15:04:51 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> patches applied upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...lude-ctype.h-drop-is-_l-macro-definitions.patch | 72 ----------------------
>  ...de-ctype.h-restore-__isctype_l-definition.patch | 32 ----------
>  package/uclibc/uclibc.hash                         |  4 +-
>  package/uclibc/uclibc.mk                           |  2 +-
>  4 files changed, 3 insertions(+), 107 deletions(-)
>  delete mode 100644 package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
>  delete mode 100644 package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch

We're past -rc1, so we normally don't take version bumps. But really
1.0.32..1.0.34 only contains bug fixes in uclibc-ng, so I applied to
master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
