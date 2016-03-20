From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:29:27 +0100
Subject: [Buildroot] [PATCH v2 1/2] m68k: enable internal toolchain
In-Reply-To: <20160319190410.GA1018@waldemar-brodkorb.de>
References: <20160319190410.GA1018@waldemar-brodkorb.de>
Message-ID: <20160320152927.0630a80a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 20:04:10 +0100, Waldemar Brodkorb wrote:
> This allows to build a m68k toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   reduce CPU variants to 68040, suggested by Thomas Petazzoni,
>   more CPU's will be added later. Qemu Q800 is 68040 only so
>   this is okay
> ---
>  arch/Config.in                               |  1 -
>  arch/Config.in.m68k                          | 20 ++++++++++++++------
>  package/gcc/4.8.5/890-fix-m68k-compile.patch | 15 +++++++++++++++
>  package/gcc/4.9.3/890-fix-m68k-compile.patch | 15 +++++++++++++++
>  package/gcc/5.3.0/890-fix-m68k-compile.patch | 15 +++++++++++++++
>  5 files changed, 59 insertions(+), 7 deletions(-)
>  create mode 100644 package/gcc/4.8.5/890-fix-m68k-compile.patch
>  create mode 100644 package/gcc/4.9.3/890-fix-m68k-compile.patch
>  create mode 100644 package/gcc/5.3.0/890-fix-m68k-compile.patch

I've applied, after slightly tweaking the commit title/log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
