From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 11:24:11 +0100
Subject: [Buildroot] [PATCH] Add KF5 package kcoreaddons
In-Reply-To: <20190204095112.2411-1-yann.morin.1998@free.fr>
References: <20190204095112.2411-1-yann.morin.1998@free.fr>
Message-ID: <20190204112411.60e01ae7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Feb 2019 10:51:12 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Pierre Ducroquet <pinaraf@pinaraf.info>
> 
> KCoreAddons provides classes built on top of QtCore to perform various tasks such as
> manipulating mime types, autosaving files, creating backup files, generating random
> sequences, performing text manipulations such as macro replacement, accessing
> user information and many more.
> 
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
> [yann.morin.1998 at free.fr + titouan.christophe at railnova.eu:
>   - add missing qt5tools select
>   - fix hash for new version
>   - fix check-package
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/kf5/Config.in                            |  1 +
>  package/kf5/kf5-kcoreaddons/Config.in            | 14 ++++++++++++++
>  package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash |  2 ++
>  package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk   | 16 ++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/kf5/kf5-kcoreaddons/Config.in
>  create mode 100644 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
>  create mode 100644 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk

Applied with the following changes:

    [Thomas:
     - fix typo in LICENSE_FILE -> LICENSE_FILES
     - add hash for license file
     - change license to LGPL-2.1 instead of LGPL-2.1+, since at least one
       file says "2.1" without the "or later" option, and so saying just
       LGPL-2.1 is the safe choice
    ]

Also, note that the commit title was not correct, so I've adjusted that
as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
