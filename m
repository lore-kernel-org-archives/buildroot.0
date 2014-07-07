From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Jul 2014 18:35:02 +0200
Subject: [Buildroot] [PATCH 14/14] defconfig/wandboard: update kernel +
	bootlaoder
In-Reply-To: <53BABB2B.8090207@gmail.com>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
 <cf148e58a53cf0c55c12e211c4367363bdf1dc0f.1404164261.git.yann.morin.1998@free.fr>
 <53BABB2B.8090207@gmail.com>
Message-ID: <20140707163502.GB3806@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien, All,

On 2014-07-07 17:22 +0200, Hadrien Boutteville spake thusly:
> There is a typo in the commit title : "bootloader" ;-).

OK.

> On Mon, 30 Jun 2014 23:52:14 +0200, Yann E. Morin wrote:
> [...]
> >  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> >  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
> 
> Is it still necessary to specify this custom name instead of using
> BR2_TARGET_UBOOT_FORMAT_IMX ?

Ah, indeed. I merely hand-edited the defconfig to set the new versions.

Will adapt before re-spinning.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
