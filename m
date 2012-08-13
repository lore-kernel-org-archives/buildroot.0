From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 15:26:18 -0300
Subject: [Buildroot] [PATCH 14/20] portmap: mention that rpcbind is the
 project that superseds portmap
In-Reply-To: <20120813193550.289adb91@skate>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <aae61f5152331e0d8e63c01ddca703e00cde1382.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208121755.19505.yann.morin.1998@free.fr> <20120813193550.289adb91@skate>
Message-ID: <502946CA.4040606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/12 14:35, Thomas Petazzoni wrote:

> Yeah, I wasn't sure about this one. Maybe we should mark it deprecated
> yes. Gustavo, do you see any use case that requires keeping portmap if
> rpcbind is available?
> 
> Thanks!
> 
> Thomas

I use a couple of apps that need RPC that i think will probably break,
but on the libc level rather than the portmapper itself so i see no
issue there.
It's probably worth trying the switch with -next so we can find and fix
those in need of a slight LDFLAGS tweak.
Regards.
