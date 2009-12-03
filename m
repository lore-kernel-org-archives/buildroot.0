From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 3 Dec 2009 12:46:51 +0100
Subject: [Buildroot] make uImage
In-Reply-To: <20091203113649.297300@gmx.net>
References: <20091203113649.297300@gmx.net>
Message-ID: <20091203114651.GQ14091@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 03, 2009 at 12:36:49PM +0100, Jens Kleinhans wrote:
> I crosscompiled the kernel 2.6.20 and now I want to make a uImage out of the zImage. I found the following command for making uImage. But when I type only options are shown. How can I build the uImage the right way?
> 
> root at benjamin-laptop:/usr/src/linux/arch/arm/boot# ls
> bootp  compressed  Image  install.sh  Makefile  zImage
> root at benjamin-laptop:/usr/src/linux/arch/arm/boot# mkimage -A arm -O linux -C none -T kernel -a 20008000 -e 20008000 -n linux-2.6 -d arch/arm/boot/zImage uImage

Why don't you use the uImage target the Linux kernel offers?

And you should _really_ consider using a more recent kernel unless you
have a good reason not to do so. 2.6.20 is indeed ancient.

Daniel
