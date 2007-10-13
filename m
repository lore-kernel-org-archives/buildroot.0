From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 13 Oct 2007 17:54:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel target etc...
In-Reply-To: <20071013101502.7A6EDA6151@busybox.net>
References: <20071013101502.7A6EDA6151@busybox.net>
Message-ID: <d6cda7730710130954u34f6158an4a924bef423239ac@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yay! Finally HEAD works for me :)

At least the toolchain build does :)

it has broken packages though.... just now I've got internal compiler
errors while compiling qtopia which has templates.

I for one welcome our new 4.2.x compiler overlords, but shouldn't we
keep 4.1.2 which is supposedly more stable, at least just as an
option?

On 10/13/07, ulf at uclibc.org <ulf@uclibc.org> wrote:
> Author: ulf
> Date: 2007-10-13 03:15:01 -0700 (Sat, 13 Oct 2007)
> New Revision: 20239
>
> Log:
> Update AVR32 toolchain with new binutils and uClibc, This time it works (cross-fingers)
>
