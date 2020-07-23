From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:17:33 +0200
Subject: [Buildroot] [PATCH v6 20/28] qt5: Fix pkgconfig search path for
 per-package infrastructure
In-Reply-To: <1d374f6d-16c2-a624-de2f-bfc8a6392694@andin.de>
References: <20200701215442.GY20645@scaer>
 <5FC5B08F-2FD5-4243-934E-A11C97636D79@getmailspring.com>
 <20200722202651.GF2296@scaer>
 <1d374f6d-16c2-a624-de2f-bfc8a6392694@andin.de>
Message-ID: <20200723201733.GG2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2020-07-23 12:29 +0200, Andreas Naumann spake thusly:
> first of all sorry for not responding for such a long time. There are just
> too many things on my table and yes, I also have a life outside the computer
> (kids, bees, wife should probably come first ...).

Yes, this is perfectly understandable. :-)
(my comment was just a joke; a bad one, I agree.)

> However, I'm still interested in the set and veeery happy that #19 was
> finally merged. Thanks everyone for reviewing and testing!
> 
> So Louis Paul, would it be possible you send your fix as a separate patch
> and once this is in, I resend what's left from the series?

Yes, we can address it in smaller, independent pieces, as long as they
make sense on their own.

I think there were two major thinks in the orioginal series:

  - making the qmake infra parallel-safe

  - fixing individual packages that are not using the qmake infra

Maybe we can first concentrate on fixing the infra, and then handle
packages.

> If IRC is needed for further coordination i can join, but I'm a bit hesitant
> because I can hardly handle the four different messengers that I'm using
> already.

Well, IRC is mostly for quick back-n-forth discussions to clarify
things, and to organise the work. It's not mandatory to join.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
