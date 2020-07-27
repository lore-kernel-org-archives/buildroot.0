From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 17:19:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/elf2flt: bump to version 2019.12
In-Reply-To: <b35424cf-1d80-49fc-86f0-cf84e0074f6f@gmail.com>
References: <20200726094338.1276868-1-fontaine.fabrice@gmail.com>
 <20200727065016.GM19818@scaer>
 <b35424cf-1d80-49fc-86f0-cf84e0074f6f@gmail.com>
Message-ID: <20200727151906.GD19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-07-27 16:25 +0200, Romain Naour spake thusly:
> Le 27/07/2020 ? 08:50, Yann E. MORIN a ?crit?:
> > On 2020-07-26 11:43 +0200, Fabrice Fontaine spake thusly:
> >> Drop first patch (already in version)
> > Romain, your feedback?
> This would reintroduce the bug added by
> https://github.com/uclinux-dev/elf2flt/commit/73325b7f209e0f68887333385184af275531427d
> The backported patch was removed by:
> https://git.buildroot.net/buildroot/commit/?id=aa3622758bb08fa517a3054076fca89f7697e550

So I take that a s "no, or we would have to carry a patch that reverts
an upstream change", right?

Marked as rejected in patchwork, then. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
