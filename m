From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 13:58:55 -0700
Subject: [Buildroot] precompiled toolchain
In-Reply-To: <AANLkTi=dQbWV3+nU41zvZ9O=m1n-S8wpevgdsNjx05Rc@mail.gmail.com>
References: <AANLkTi=dQbWV3+nU41zvZ9O=m1n-S8wpevgdsNjx05Rc@mail.gmail.com>
Message-ID: <AANLkTimxZumxok2uV0vV0DwaihCV501PiKY2PBUSPwOy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 3, 2010 at 12:33 AM, Sergey Naumov <sknaumov@gmail.com> wrote:
> Hello.
>
> Does anybody know whether it is possible to compile toolchain with gcc
> and uclibc first (so 3 passes for gcc and 2 passes for uclibc), and
> then change the config file for uclibc and compile it 3-rd time? Gcc
> only needs uclibc with minimal configuration or configuration have to
> be the same as at the target system? It is worth if we want to conduct
> some experiments with uclibc config but do not want to recompile gcc
> all the time.
>

Doesnt it work that way now ? if you build it once and make changes to
uclibc it should only recompile the needed.
you can also create the toolchain and then install it as external
toolchain and use it to compile BR then you can play with
uclibc config.

> Sergey Naumov.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
