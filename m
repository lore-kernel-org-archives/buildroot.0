From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 May 2013 18:00:43 +0200
Subject: [Buildroot] [PATCH 03/12] sqlite: Added host compilation support
In-Reply-To: <8140659616798576915@unknownmsgid>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-3-git-send-email-shmuelzon@gmail.com>
 <20130520132615.GA3164@free.fr> <8140659616798576915@unknownmsgid>
Message-ID: <20130520160043.GF3164@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Assaf, All,

Please, do not to-post. Reply in-place, as below:

On 2013-05-20 17:27 +0300, Assaf Inbal spake thusly:
> You're correct, However, I have a personal package which relies on
> sqlite as a part of the build process.

OK, I understand.

> I figured that since I already spent the time to write those entire
> two lines and made sure it works, I might as well send in the patch.

It's not my take to decide, but I guess as no package in upstream
Buildroot depends on host-sqlite, there is no reason we add it.

Unless you can submit your package for inclusion, that is, in which
case you should submit this host-sqlite package at the same time
(but in a separate patch, of course).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
