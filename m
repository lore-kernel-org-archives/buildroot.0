From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 6 Aug 2010 18:44:48 +0200
Subject: [Buildroot] External toolchain doesn't support --sysroot.
In-Reply-To: <AANLkTim-th7FF0dh0ZecLeRMZ+0iMFYpMZrM5QsWLYRL@mail.gmail.com>
References: <AANLkTim-th7FF0dh0ZecLeRMZ+0iMFYpMZrM5QsWLYRL@mail.gmail.com>
Message-ID: <201008061844.48326.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anthony, All,

On Friday 06 August 2010 18:09:21 anthony henderson wrote:
> I'm trying to use an external ARM tool chain to build some packages.
> However build root does not see the compiler "Incorrect selection of the C
> library". Some exploration shows that the compiler does not have a sysroot
> set

AFAIK, sysroot support in the toolchain is mandatory for use as an external
toolchain in buildroot.

> arm-linux-gcc -v
> Using built-in specs.
> Target: arm-linux-uclibc
> Configured with:
> /opt/buildroot.920t-cc/toolchain_build_arm_nofpu/gcc-4.1.1/configure

gcc-4.1.1 is old... Can't you upgrade?

> Can anyone tell me if there is a way round this?

Ask your 'provider' for a sysrooted toolchain.
Or better yet, ask them for the _sources_, and build your own toolchain.
Or even better yet, build your own toolchain with up-to-date components.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
