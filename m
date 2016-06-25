From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 14:15:39 +0200
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-3-daggs@gmx.com>
Message-ID: <b8924dx4on.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 24 Jun 2016 21:22:55 +0300 schrieb Dagg Stompler:

> v2 -> v3:
>  - fix sum256 value.
>  - fix patch.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/Config.in                                  |  1 +
>  ...-fix-makefiles-to-allow-cross-compilation.patch | 96
>  ++++++++++++++++++++++ package/libamcodec/Config.in                    

Hi,

the patch fails to apply:

Applying 0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch 
using patch: 
patching file amadec/Makefile
patching file amavutils/Makefile
patching file amcodec/Makefile
Hunk #1 FAILED at 27 (different line endings).
1 out of 1 hunk FAILED -- saving rejects to file amcodec/Makefile.rej
patching file amcodec/rules.mk
Hunk #1 FAILED at 2 (different line endings).
1 out of 1 hunk FAILED -- saving rejects to file amcodec/rules.mk.rej
Patch failed!  Please fix 0001-libamcodec-fix-makefiles-to-allow-cross-
compilation.patch!

I applied the patch using this command:

wget http://patchwork.ozlabs.org/patch/640344/mbox/ -O - | git am

Regards, Bernd
