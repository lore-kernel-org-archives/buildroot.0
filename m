From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Apr 2021 22:40:42 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/libtomcrypt: compile with
 -fPIC to enable linking to dynamic libraries/exectuables
In-Reply-To: <20210412221557.04314b5f@windsurf.home>
References: <20210412195527.9282-1-ps.report@gmx.net>
 <20210412195527.9282-2-ps.report@gmx.net>
 <20210412221557.04314b5f@windsurf.home>
Message-ID: <20210412224042.3b2ff137@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 12 Apr 2021 22:15:57 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 12 Apr 2021 21:55:26 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Fixes:
> >
> >   .../x86_64-buildroot-linux-gnu/bin/ld: .../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libtomcrypt.a(md5.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> In which situations? Are there some autobuilder failures? If not, what
> configuration fails?

Failure with an custom project which links libtomcrpyt to/into a dynamic
library (x86_64)...., sorry no autobuilder failure (there is only one
libtomcrypt cosumer in buildroot until now, dopbear)...

Regards,
Peter

>
> Thomas
