From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Feb 2013 11:59:39 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <876220fqg5.fsf@dell.be.48ers.dk>
References: <20130209195709.323b9f5e@skate>
 <201302100047.23872.yann.morin.1998@free.fr>
 <876220fqg5.fsf@dell.be.48ers.dk>
Message-ID: <201302101159.39204.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 10 February 2013 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> ---8<---
>  Yann>     Minimal network-enabled system:   [*]
>  Yann>       ARM Raspberry Pi
>  Yann>       Pre-built ct-ng toolchain
>  Yann>       busybox + not-so-minimal kernel
>  Yann>       Build time: 1 minute 55 seconds
>  Yann>       Image size: 9.2 MiB (rootfs) + 1.8 MiB (kernel)
> 
> Why is the rootfs so big? Kernel modules / glibc?

Yes, this was not a "default" configuration, and there are so many
kernel modules. And glibc does not account for much of the size.

> A default rootfs (internal toolchain, busybox) is less than 1.5MB:
> -rw-r--r-- 1 peko peko 1.4M Feb 10 09:49 output/images/rootfs.tar
> Around half of that is busybox, other half is uClibc.

Yes, we already achieved such a size at ELC-E 2 years ago, during the
Yocto presentation. ;-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
