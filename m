From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:06:57 +0200
Subject: [Buildroot] qemu compiling error
In-Reply-To: <543F6BBE.3070000@free.fr>
References: <543E3CBC.5080901@free.fr>
 <543F6BBE.3070000@free.fr>
Message-ID: <20141017220657.GP3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2014-10-16 08:54 +0200, St?phane ANCELOT spake thusly:
> I want being able to emulate an x86 32 bits platform from a 64 bits os with
> qemu launched in buildroot.

I am not sure to understand that. It seems you want host-qemu.
What you have selected is QEMU *on* the target.

> The build fails because --disable-system option is enabled and thus inhibits
> selection target-list i386soft-mmu to build.
> removing --disable-system this option will permit to build it.

As said, this is known.

> Please correct it.

Grr... I do not like being told what I should do on my spare time,
especially in such an aggressive tone... :-(

This is a community effort, we are all volunteers. You can not ask such
things in that manner.

Just because of that, you just demotivate people from actually doing
the work... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
