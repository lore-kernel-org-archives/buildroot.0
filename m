From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Nov 2016 18:15:16 +0100
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <1479134749.4408.54.camel@synopsys.com>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
 <20161111151832.1649d24e@free-electrons.com>
 <1479126748.3874.28.camel@synopsys.com>
 <20161114150740.394bdd02@free-electrons.com>
 <1479133987.4408.48.camel@synopsys.com>
 <20161114154211.66ff86bf@free-electrons.com>
 <1479134749.4408.54.camel@synopsys.com>
Message-ID: <20161114171516.GB3399@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2016-11-14 14:46 +0000, Alexey Brodkin spake thusly:
[--SNIP--]
> The point is we were sitting on the patch for quite some time and when we saw
> RC1 was cut (as always unexpectedly :)) simply sent out what we had in our tree.

"Unexpectedly" is a bit of untrue: we've been doing releases every three
months since February 2009, 7 years ago, with a one-month freeze before
the release.

So, anything that comes on-or-after the first day of the release month is
not guaranteed to go in master, unless it is a fix.

This is far from "unexpected". ;-)

Granted, the rc1 tag can be (and has often been) delayed by a few days,
but this is a minor delay; it has never been guaranteed the first few
days of the stabilisation month would still be open for merging into
master...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
