From: Simon Pasch <fpasch@googlemail.com>
Date: Fri, 26 Oct 2007 09:30:19 +0200
Subject: [Buildroot] Cant compile Mplayer package.
In-Reply-To: <13409170.post@talk.nabble.com>
References: <13409170.post@talk.nabble.com>
Message-ID: <4721978B.7020501@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try to remove the atmel-patch in the package/mplayer directory.

As I posted some time ago...This Patch should depend on the chosen 
architecture.

shade wrote:
> Hi, Im not able to compile mplayer package in current svn version of
> buildroot. Target architecture is 386. Build fails with: "cabac.h:513:
> error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'".
> Please, can You provide any suggestions how to fix this problem? Thx.
>  
