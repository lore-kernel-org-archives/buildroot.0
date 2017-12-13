From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Dec 2017 20:39:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-10
In-Reply-To: <20171211070006.B3DAC206E8@mail.free-electrons.com>
References: <20171211070006.B3DAC206E8@mail.free-electrons.com>
Message-ID: <20171213193924.GC7364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-11 08:00 +0100, Thomas Petazzoni spake thusly:
>          arc |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/5231ff39a0839ec5e1962662004214d4b0773068 |     

I've tried to reproduce this a few times, and I was not able to. It looks
like a parallel build issue (again).

I'll try to see if I can fix that upstream, but I have little hope,
given that the Makefile provided by upstream already states that it is
not correct... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
