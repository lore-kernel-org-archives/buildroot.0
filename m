From: =?UTF-8?B?U3TDqXBoYW5lIEFOQ0VMT1Q=?= <sancelot@free.fr>
Date: Fri, 03 Oct 2014 09:38:40 +0200
Subject: [Buildroot] qemu kvm
In-Reply-To: <20141002204307.GC19775@free.fr>
References: <294053671.117038602.1412282292148.JavaMail.root@zimbra9-e2.priv.proxad.net>
 <20141002204307.GC19775@free.fr>
Message-ID: <542E5280.7050406@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Humm...not sure, maybe I have not understood or you have not understood :

I want to make a bootable buildroot system.

I can boot this buildroot system with the PC BIOS
when buildroot system is booter , I have got qemu available in it and I 
can  launch another OS with this qemu.

is it right ?
Regards,
S.Ancelot

On 02/10/2014 22:43, Yann E. MORIN wrote:
> St?phane, All,
>
> On 2014-10-02 22:38 +0200, St?phane ANCELOT spake thusly:
>> Is it possible using buildroot to create a mini system that will launch
>> a virtualized os ?
> Yes.
>
> See in the Buildroot source tree:
>      board/qemu/
>
> And the defconfig we have:
>      make help |grep qemu
>
> Regards,
> Yann E. MORIN.
>
