From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Nov 2019 21:54:55 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191115201909.GA24188@x230>
References: <20191114200219.1568-1-petr.vorel@gmail.com>
 <20191114213050.GF26360@scaer> <20191115193118.GA19966@x230>
 <20191115201909.GA24188@x230>
Message-ID: <20191115205455.GA32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-11-15 21:19 +0100, Petr Vorel spake thusly:
[--SNIP--]
> OK, external toolchain has older MUSL, it's without 
> f67b3c17 ("sys/fanotify.h: update for linux v5.1")
> from v1.1.23. => need to fix autoconf in LTP for latest musl release.

Thank you for the very good investigations! :-)

> I didn't realized that there could be more MUSL versions,
> next time, I'll check with utils/test-pkg

I noticed the build failure by just building the config file from the
autobuild referenced in your commit log. I did not even try to build it
with test-pkg...

> support/config-fragments/autobuild/*musl*
> and also for internal toolchain (somehow wasn't able to use 
> support/config-fragments/autobuild/*internal-*musl* with utils/test-pkg).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
