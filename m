From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Nov 2016 18:33:55 +0100
Subject: [Buildroot] unable to build pseudo in buildroot 2016.11-rc1
In-Reply-To: <CAAkeqgXqfkeO1xJ563CQiL-A2XXWSs1NTpPjy8XSP-53p43_QQ@mail.gmail.com>
References: <CAAkeqgXqfkeO1xJ563CQiL-A2XXWSs1NTpPjy8XSP-53p43_QQ@mail.gmail.com>
Message-ID: <20161110173355.GA3564@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrey,

Please send issues to the mailing list. Do not ask in private.

On 2016-11-10 17:29 +0000, Andrey Yurovsky spake thusly:
> Hi Yann.  Thanks for working on the pseudo/fakeroot issue.  I wanted to try
> out the latest and here's the issue I'm having building the host-pseudo
> package in case it's helpful.
[--SNIP--]
> Makefile:163: recipe for target 'pseudo_wrappers.o' failed
> make[2]: *** [pseudo_wrappers.o] Error 1
> In file included from pseudo_ports.h:15:0,
>                  from pseudo.h:171,
>                  from pseudo_client.c:45:
> ports/linux/xattr/portdefs.h:1:24: fatal error: attr/xattr.h: No such file or directory
>  #include <attr/xattr.h>
>                         ^

This issue  is known and has already been fixed by commit a25210b.
Please update your local tree.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
