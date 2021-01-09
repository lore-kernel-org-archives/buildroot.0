From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 19:11:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: add backtrace support
 option
In-Reply-To: <20210109180319.GA3037565@scaer>
References: <20210109161900.51824-1-andrea.ricchi@amarulasolutions.com>
 <20210109180319.GA3037565@scaer>
Message-ID: <20210109181112.GA3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrea, All,

On 2021-01-09 19:03 +0100, Yann E. MORIN spake thusly:
> On 2021-01-09 17:19 +0100, Andrea Ricchi spake thusly:
> > Add toolchain configuration to support execinfo.h and backtrace
> > features.

I also forgot to state that uClibc-ng builds libubacktrace, not
libbactrace, so applications would need to have special handling to
explicitly load libubacktrace anyway...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
