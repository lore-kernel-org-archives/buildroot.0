From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 29 Apr 2020 11:12:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/luajit: bump to version 2.2.0
In-Reply-To: <CAB0FRsshdtxxWBjQo4=LqE9Kx4QMv25TVs5kxzFKK75sMAFGkw@mail.gmail.com>
References: <20200428110101.11716-1-titouan.christophe@railnova.eu>
 <CAB0FRsshdtxxWBjQo4=LqE9Kx4QMv25TVs5kxzFKK75sMAFGkw@mail.gmail.com>
Message-ID: <e85ff399-434c-97be-6567-8b07186be42e@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,
On 29/04/20 10:27, Fran?ois Perrad wrote:
> 
> 
> Le?mar. 28 avr. 2020 ??13:01, Titouan Christophe 
> <titouan.christophe at railnova.eu <mailto:titouan.christophe@railnova.eu>> 
> a ?crit?:
> 
>     Version 2.2.0 introduces Lua 5.3 and extends Lua 5.2 extensions, see
>     https://github.com/moonjit/moonjit/releases/tag/2.2.0
> 
>     Moonjit 2.2.0 replaced references to "LuaJIT" by "moonjit", which
>     introduces some changes in the Makefile and COPYRIGHT.
> 
>     Also update the hash file to the new 2 spaces convention
> 
>     Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu
>     <mailto:titouan.christophe@railnova.eu>>
> 
> 
> moonjit is one fork of LuaJIT.
> moonjit serie 2.1 stay close to LuaJIT 2.1.0 beta3 (only latest fixes 
> from Mike Pall)
> moonjit serie 2.2 not, and moonjit 2.2.0 (the first one) has some issues :
>  ? ? - https://github.com/moonjit/moonjit/issues/85
>  ? ? - https://github.com/moonjit/moonjit/issues/86 (my fault)

I guess I'll mark the patch as rejected for now then.

> 
> in my point of view, the switch to moonjit is temporary,
> I still hope an official reiease of LuaJIT 2.1

Thank you for the information.

I thought MoonJIT was to replace LuaJIT "forever", since there's no 
update on LuaJIT for nearly 3 years, while MoonJIT is under active 
development.

> 
> see also some old discussions:
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-package-luajit-bump-to-version-2-1-x-developpment-version-td219875.html
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-package-luajit-switch-to-moonjit-fork-td241218.html >
> Fran?ois
> 

Regards,

Titouan
