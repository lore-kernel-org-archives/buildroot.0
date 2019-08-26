From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 26 Aug 2019 21:24:23 +0200
Subject: [Buildroot] [PATCH v2] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20190731193119.10522-1-petr.vorel@gmail.com>
References: <20190731193119.10522-1-petr.vorel@gmail.com>
Message-ID: <20190826192421.GA17887@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> + add myself as a maintainer.

> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Update to 1.2.1 (thus drop patch
> 0001-evmctl-use-correct-include-for-xattr.h.patch)
> * Fix build by adding required selects (BR2_PACKAGE_OPENSSL and BR2_PACKAGE_KEYUTILS)
> * Add depends on BR2_USE_MMU and !BR2_STATIC_LIBS (based on keyutils dependency)
> * cleanup comments

ping, please.
https://patchwork.ozlabs.org/patch/1139978/

Kind regards,
Petr
