From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 18:55:12 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add coldfire support
In-Reply-To: <20160429175123.GA27368@waldemar-brodkorb.de>
References: <20160429175123.GA27368@waldemar-brodkorb.de>
Message-ID: <20160430185512.65934b09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 19:51:23 +0200, Waldemar Brodkorb wrote:
> Add support for m68k/coldfire. A gcc patch is required
> to avoid gcc ICE.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks, I've applied.

>  package/gcc/4.8.5/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
>  package/gcc/4.9.3/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
>  package/gcc/5.3.0/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
>  package/gcc/6.1.0/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++

It would be good if this patch could be submitted upstream.

>  package/gcc/gcc-final/gcc-final.mk           |  8 ++++++++

And if the weird trick here could also be investigated.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
