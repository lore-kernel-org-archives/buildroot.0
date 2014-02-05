From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Feb 2014 00:18:17 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <52F2BF55.3050200@mind.be>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
 <CAAXf6LVM939GcFkXA6UkifUEs9H6sQnKgDqW8uBHQD3_JK0-OA@mail.gmail.com>
 <52F2BF55.3050200@mind.be>
Message-ID: <20140205231817.GB19446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-02-05 23:46 +0100, Arnout Vandecappelle spake thusly:
> make rpi_defconfig
> add some packages
> test test test
> add more packages
> test test test
> make savedefconfig
> 
> Oops I've just overwritten rpi_defconfig.

Oh no! Not rpi_defconfig!

Sorry, couldn't resist... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
