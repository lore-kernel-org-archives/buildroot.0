From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 13 Nov 2020 20:07:17 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/linux-backports: bump
 version to 5.8
In-Reply-To: <20201113130941.67928-2-ju.o@free.fr>
References: <20201112120155.333290-1-ju.o@free.fr>
 <20201113130941.67928-1-ju.o@free.fr>
 <20201113130941.67928-2-ju.o@free.fr>
Message-ID: <20201113190717.GB88501@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

> Attempting to compile this package with newer Kernel version (e.g. v5.4)
> fails with message:

>    Generating local configuration database from kernel ...Kernel version parse failed!

> Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
> rather old and beat the very purpose of having newer drivers in older
> kernels.

> Since backports tag v4.14-rc4-1, the requirement on minimal kernel
> version changed from 3.0 to 3.10. See commit [1]. The minimal kernel
> version check is changed accordingly.

> License files are also updated: the linux backports package copies the
> license files from the kernel version used for its generation. v5.8 is now
> "GPL-2.0 WITH Linux-syscall-note".

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/commit/?id=a0d05f9f9ca50ea8b1d60726fac6b54167257e76

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for your fixes!

Kind regards,
Petr
