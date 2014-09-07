From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Sep 2014 14:45:33 +0200
Subject: [Buildroot] [PATCH 2 of 5 v3 for 2014.08] gendoc infra: use
 $(pkgname) instead of explicitly passing 'manual'
In-Reply-To: <f7050051dd5a40307465.1407957948@localhost>
References: <patchbomb.1407957946@localhost>
 <f7050051dd5a40307465.1407957948@localhost>
Message-ID: <20140907124533.GF31418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-13 21:25 +0200, Thomas De Schampheleire spake thusly:
> Note that this means that if we want to use the same GENDOC infrastructure
> for another document, it will have to reside in a separate directory than
> the manual.

I would be very much interested to use this GENDOC infrastructure from
br2-external too, to generate another manual.

I'll poke at that when time permits (soon, probably.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
