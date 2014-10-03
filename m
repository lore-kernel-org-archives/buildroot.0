From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Oct 2014 17:56:28 +0200
Subject: [Buildroot] qemu kvm
In-Reply-To: <542E5280.7050406@free.fr>
References: <294053671.117038602.1412282292148.JavaMail.root@zimbra9-e2.priv.proxad.net>
 <20141002204307.GC19775@free.fr> <542E5280.7050406@free.fr>
Message-ID: <20141003155628.GA3897@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2014-10-03 09:38 +0200, St?phane ANCELOT spake thusly:
> Humm...not sure, maybe I have not understood or you have not understood :
> 
> I want to make a bootable buildroot system.
> 
> I can boot this buildroot system with the PC BIOS
> when buildroot system is booter , I have got qemu available in it and I can
> launch another OS with this qemu.

Ah, so you want QEMU on the target.

We do not have a QEMU package for the target for now. I have a (pretty
large) patch series that adds it, but it has been lingering for about
two years now.

I am about to respin it in the coming days (hopefully before the end of
the week end).

You can searrch the ML archives for the last time it was submitted
(hint: quite a long time ago).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
