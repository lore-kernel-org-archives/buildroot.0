From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Jun 2019 19:45:12 +0200
Subject: [Buildroot] [PATCH v4] package/exiv2: cleanup options and
 licenses
In-Reply-To: <20190606151549.GA2560@scaer>
References: <20190605134957.27400-1-nicolas.serafini@sensefly.com>
 <20190605234535.1abf3c33@gmx.net>
 <2a9e28d2-1dfc-5a66-e0f4-16241adca391@mind.be>
 <20190606151549.GA2560@scaer>
Message-ID: <20190606174512.GA13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,,

On 2019-06-06 17:15 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> [...] Instead, we should have done
> something like:
>     package/exiv2/exiv2.mk:
>     ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
>     EXIV2_LICENSE := $(EXIV2_LICENSE), Proprietary/Unknown (Nikon lens database)
>     endif

Scratch that part about the lens data; I read the current consdition
backwards...

Even then, it does not change the rest of the reasoning.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
