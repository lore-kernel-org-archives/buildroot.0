From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 17:44:51 +0100
Subject: [Buildroot] [PATCH 0/2] package/norm: prepare for Python3
In-Reply-To: <20200204133157.10824-1-titouan.christophe@railnova.eu>
References: <20200204133157.10824-1-titouan.christophe@railnova.eu>
Message-ID: <20200205164451.GH3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2020-02-04 14:31 +0100, Titouan Christophe spake thusly:
> This small series update the norm package to make it possible to compile it
> using a Python3 based waf package infrastructure, and changes the download
> server to Github to enhance the reliability of the tarball download, because
> the original server is quite slow and unreliable.
> 
> Titouan Christophe (2):
>   package/norm: switch to Github hosted archive
>   package/norm: make wscript Python3 compatible

Series applied to master, thanks.

I just re-aligned the hash fields with the new spacing convention.

Thanks!

Regards,
Yann E. MORIN.

>  ...ction-call-for-Python3-compatibility.patch | 29 +++++++++++++
>  ...ixed-tabs-spaces-in-protolib-wscript.patch | 41 +++++++++++++++++++
>  package/norm/norm.hash                        |  2 +-
>  package/norm/norm.mk                          |  4 +-
>  4 files changed, 73 insertions(+), 3 deletions(-)
>  create mode 100644 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch
>  create mode 100644 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch
> 
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
