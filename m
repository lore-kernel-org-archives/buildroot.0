From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 2 Dec 2010 10:22:30 +0100
Subject: [Buildroot] BR2_VERSION missing in .config BR 2010.11
In-Reply-To: <000001cb9201$818041c0$8480c540$@de>
References: <000001cb9201$818041c0$8480c540$@de>
Message-ID: <201012021022.30364.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, All,

On Thursday 02 December 2010 10:15:35 Ben wrote:
> I use BR2 version 2010.11. When I just extract the stable version and run
> "make menuconfig", change nothing and save the config, the BR2_VERSION
> string is missing in .config file.

Please see: git log 2d239bb..75efd6b

Where and how do you use BR2_VERSION ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
