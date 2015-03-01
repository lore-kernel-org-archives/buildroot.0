From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 1 Mar 2015 11:53:37 +0100
Subject: [Buildroot] [PATCH 0/3] uclibc: add support for uClibc-ng
In-Reply-To: <1423947668-23312-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423947668-23312-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150301105336.GE3937@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> The following three set of patches add support for uClibc-ng. The main
> patch is based on previous work from Waldemar (thanks!).
> 
> I have build tested and runtime tested in Qemu the following
> configurations: ARM Cortex-A9 EABIhf (qemu-vexpress) and Xtensa NPTL
> (qemu emulation). The build includes the toolchain, Busybox and the
> kernel.

I have tested Qemu-Mips (le), Qemu-SH4, Qemu-Sparc and Qemu-ARM.
All worked fine.

You can add
Tested-By: Waldemar Brodkorb <wbx@uclibc-ng.org>

Best regards
 Waldemar
