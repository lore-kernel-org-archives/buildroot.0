From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2012 19:24:19 +0100
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <50916BCC.2080409@fnac.net>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <50916BCC.2080409@fnac.net>
Message-ID: <201210311924.19411.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On Wednesday 31 October 2012 Paul Chavent wrote:
> On 10/31/2012 12:32 PM, Alexander Khryukin wrote:
> > I'm trying to build busybox with glibc
> > and faced with error
> > util-linux/mount.c:140:22: fatal error: rpc/rpc.h: No such file or directory
> > Does anybody have any solution?
> 
> I add the --enable-obsolete-rpc to the eglibc configure options.

That works only with glibc-2.16 or later (ditto for eglibc), but
Alexander is using 2.14.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
