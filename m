From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 May 2017 23:29:06 +0200
Subject: [Buildroot] [PATCH v2] package/efl: fix unmet dependencies
In-Reply-To: <bfcd0a55-957d-f5e8-922f-ede41dff9c47@gmail.com>
References: <20170508211149.1964-1-yann.morin.1998@free.fr>
 <bfcd0a55-957d-f5e8-922f-ede41dff9c47@gmail.com>
Message-ID: <20170508212906.GC3544@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-05-08 23:25 +0200, Romain Naour spake thusly:
> Le 08/05/2017 ? 23:11, Yann E. MORIN a ?crit :
[--SNIP--]
> > +		|| !BR2_PACKAGE_EFL_EEZE || !Br2_EMNABLE_LOCALE
> meh s/Br2/BR2/
> s/Br2_EMNABLE_LOCALE/BR2_ENABLE_LOCALE/

Yep, so I'll refrain from hacking anymore before I get some sleep...

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
