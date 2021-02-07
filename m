From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Feb 2021 17:52:37 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support
 for Arrow Avenger96 board
In-Reply-To: <87h7mnyi4p.fsf@tarshish>
References: <20210207155534.7211-1-peter@korsgaard.com>
 <87h7mnyi4p.fsf@tarshish>
Message-ID: <20210207165237.GP2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-02-07 18:09 +0200, Baruch Siach spake thusly:
> On Sun, Feb 07 2021, Peter Korsgaard wrote:
> > +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> Maybe warn that this overwrites data on the SD card.

As far as I could see, we don't do that in any of the 72 readme.txt we
already have...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
