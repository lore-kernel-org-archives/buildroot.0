From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jan 2021 17:16:30 -0300
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install
 the VPU firmware into a valid location
In-Reply-To: <aeea51ae-483e-1cfc-0c5d-222aaf2d5400@gmail.com>
References: <20210113120822.327-1-festevam@gmail.com>
 <0a7f5a1d-e930-084a-3372-3ecc736a810a@smile.fr>
 <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
 <aeea51ae-483e-1cfc-0c5d-222aaf2d5400@gmail.com>
Message-ID: <CAOMZO5Bs5ieYti4i5L0TCEz6uV7Zt8UkXbh=_S7mC99MLKio-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 13, 2021 at 5:02 PM Romain Naour <romain.naour@gmail.com> wrote:

> What about a simlink ?

Yes, that would work.

Actually, I tried it here, but it ended up with a symlink to the host
PC Buildroot path.

If you could give me a suggestion on how to properly implement the
symlink in firmware-imx.mk, I would appreciate it.

Thanks
