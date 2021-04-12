From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Apr 2021 22:15:57 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/libtomcrypt: compile with
 -fPIC to enable linking to dynamic libraries/exectuables
In-Reply-To: <20210412195527.9282-2-ps.report@gmx.net>
References: <20210412195527.9282-1-ps.report@gmx.net>
 <20210412195527.9282-2-ps.report@gmx.net>
Message-ID: <20210412221557.04314b5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Apr 2021 21:55:26 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   .../x86_64-buildroot-linux-gnu/bin/ld: .../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libtomcrypt.a(md5.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

In which situations? Are there some autobuilder failures? If not, what
configuration fails?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
