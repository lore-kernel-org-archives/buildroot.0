From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:56:16 +0100
Subject: [Buildroot] [PATCH 2/2] package/libtirpc: fix build when
 missing <bits/endian.h>
In-Reply-To: <20200228173052.5128-2-petr.vorel@gmail.com>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
 <20200228173052.5128-2-petr.vorel@gmail.com>
Message-ID: <20200303225616.17190554@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 18:30:52 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> This fixes build on riscv64:
> 
> http://autobuild.buildroot.net/results/a334f774e95fb7805568fc3868d5cf1d790a6e73
> http://autobuild.buildroot.net/results/9cf80bdd4d329788c89596b56205ef215ee09c35
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...r_float-do-not-include-bits-endian.h.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libtirpc/0006-xdr_float-do-not-include-bits-endian.h.patch

This issue seems to be happening only on the next branch. Why? Anything
special in next compared to master?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
