From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 13 Nov 2020 20:06:52 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/linux-backports: fix kernel
 version check
In-Reply-To: <20201113130941.67928-1-ju.o@free.fr>
References: <20201112120155.333290-1-ju.o@free.fr>
 <20201113130941.67928-1-ju.o@free.fr>
Message-ID: <20201113190652.GA88501@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

> The commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f "infra/pkg-kconfig:
> do not rely on package's .config as a timestamp" broke the kernel
> version check of this linux-backports package (it was no longer
> executed). Since linux-4.19, the kernel's build system internally
> touches its .config file, so it can no longer be used as a stamp file.
> The stamp file defined in KCONFIG_STAMP_DOTCONFIG variable of
> pkg-kconfig infra need to be used instead.

> This commit fixes the kernel version check.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
