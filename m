From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Feb 2017 23:01:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170217211242.GC3470@free.fr>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
Message-ID: <20170217220100.GE3470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-02-17 22:12 +0100, Yann E. MORIN spake thusly:
> >         i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/b7f95e39d5b6984594fbf1e7549ddb3cf281600c
> Tries to link with host libraries. I'll take it.

I was not able to reproduce... :-(

> >         or1k |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c24dd55e773167be182f40ae723e82d3f71c6eba
>     error: field 'uc_mcontext' has incomplete type

Waldemar has sent a patch to fix all those ucontext issues on or1k:
    https://patchwork.ozlabs.org/patch/729373/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
