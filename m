From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 26 May 2008 11:49:05 -0300
Subject: [Buildroot] QTopia build
In-Reply-To: <a53deff80805260502j65b435bbo6be68d358c4806f7@mail.gmail.com>
References: <a53deff80805260502j65b435bbo6be68d358c4806f7@mail.gmail.com>
Message-ID: <d6cda7730805260749w76d227fv401fc7d7a06ca9be@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You might want to try using this repository: http://code.google.com/p/buildroot/

It's a fork, but works better. Among many other things, here we patch
qmake.conf to make sure the generated makefiles will use the
crosscompiler from buildroot, and not something else. This used to be
done in mainstream, but was reverted without field testing.

Kind Regards,
    Thiago A. Correa

On Mon, May 26, 2008 at 9:02 AM, Papa Malick SARR <malicksarr@gmail.com> wrote:
> Hi
>
> When I'm trying to build  qtopia, it seems buildroot use my native compiler
> in place of his cross compiler. Why
>
>
>
> native compiler= g++
>
> crosscompiler=i686-linux-pc-uClibc-g++
>
>
>
>
> Best regards
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
