From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:50:43 +0200
Subject: [Buildroot] Spidermonkey bump version
In-Reply-To: <e032db30-ff9b-5ace-9554-9959d2db24bf@benettiengineering.com>
References: <a59a82c3-0000-73ca-6c6d-7ac2aef7ff2e@benettiengineering.com>
 <20210520103341.GZ2268078@scaer>
 <0231243a-bd17-2c0a-7486-80a28fd662c4@benettiengineering.com>
 <20210522204250.GK3208066@scaer>
 <e032db30-ff9b-5ace-9554-9959d2db24bf@benettiengineering.com>
Message-ID: <20210524175043.GK3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-05-24 17:56 +0200, Giulio Benetti spake thusly:
> On 5/22/21 10:42 PM, Yann E. MORIN wrote:
> >>Since we need spidermonkey 78 for polkit 0.118 I would go for bumping
> >>spidermonkey to 0.78 if it's not too difficult.
> >Well, it is not going to be easy: the package has switched over to rust,
> >so there will be some work to do. We have no package infra for rust, so
> >you'll have to look at other packages how they handle things...
> I've given a try and yes it's not easy at all, I don't have time to do it.
> Thank you anyway.

Yea,h, I did not expect it to be straightforward... Thanks for having
had a look. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
