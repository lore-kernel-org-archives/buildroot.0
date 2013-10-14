From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 22:32:17 +0200
Subject: [Buildroot] [PATCH 4/4] package/weston: bump to 1.3.0
In-Reply-To: <87r4bnoats.fsf@dell.be.48ers.dk>
References: <cover.1381770790.git.yann.morin.1998@free.fr>
 <cover.1381770790.git.yann.morin.1998@free.fr>
 <7abd572f6a4cf8a560199ddab748ca1dcc3cbd7c.1381770790.git.yann.morin.1998@free.fr>
 <87r4bnoats.fsf@dell.be.48ers.dk>
Message-ID: <20131014203217.GD3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-10-14 22:29 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> Needs three patches from upstream.
> 
> Thanks, but there still seems to be some fbdev / GLES issues:
> 
> make[4]: Entering directory `/home/peko/source/buildroot/output/build/weston-1.3.0/tests'
>   CC       weston_test_la-weston-test.lo
>   CC       weston_test_la-wayland-test-protocol.lo
>   CC       surface-test.lo
>   CC       surface-global-test.lo
>   CC       config-parser-test.o
>   CC       libshared_test_la-weston-test-runner.lo
>   CC       vertex-clip-test.o
>   CC       vertex-clipping.o
> In file included from vertex-clip-test.c:30:0:
> ../src/vertex-clipping.h:25:23: fatal error: GLES2/gl2.h: No such file or directory
> compilation terminated.

Doh. It did not occur here.

> Perhaps we can just disable building the tests?

Will see to it. thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
