From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 14:54:37 +0200
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
In-Reply-To: <b8924dx4on.ln2@ID-313208.user.individual.net>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-3-daggs@gmx.com>
 <b8924dx4on.ln2@ID-313208.user.individual.net>
Message-ID: <20160625145437.00e8f5bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Jun 2016 14:15:39 +0200, Bernd Kuhls wrote:

> the patch fails to apply:
> 
> Applying 0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch 
> using patch: 
> patching file amadec/Makefile
> patching file amavutils/Makefile
> patching file amcodec/Makefile
> Hunk #1 FAILED at 27 (different line endings).
> 1 out of 1 hunk FAILED -- saving rejects to file amcodec/Makefile.rej
> patching file amcodec/rules.mk
> Hunk #1 FAILED at 2 (different line endings).
> 1 out of 1 hunk FAILED -- saving rejects to file amcodec/rules.mk.rej
> Patch failed!  Please fix 0001-libamcodec-fix-makefiles-to-allow-cross-
> compilation.patch!
> 
> I applied the patch using this command:
> 
> wget http://patchwork.ozlabs.org/patch/640344/mbox/ -O - | git am

If the original code uses DOS line endings, then the patch normally
contains them, but they very often get damaged by patches sent over
e-mail, so I'm not surprised. If that's the only issue, I can fix that
up when applying the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
