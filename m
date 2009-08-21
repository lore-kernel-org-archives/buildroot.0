From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 21 Aug 2009 20:10:30 +0200
Subject: [Buildroot] Buildroot and OpenEmbedded
In-Reply-To: <4A8C6541.3080002@atmel.com>
References: <5f2b60908130604i7175f89h533d1b8f8444e60f@mail.gmail.com>	<87a5b0800908130628i760f152eu84237eb985227c36@mail.gmail.com>	<5f2b60908131255l128ec735r2b07c70e7bb46df9@mail.gmail.com>
	<4A8C6541.3080002@atmel.com>
Message-ID: <4A8EE316.5040908@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Ulf Samuelsson a ?crit :
>
> Buildroot is good to hand out to beginners, for them to learn.
> It can do a good job for non-graphic applications.
> If you want an advanced user-interface, then you go OE.
>   
Correct me if I'm wrong:
If you want to build a PDA or a smartphone OE might be cool, but
otherwise it's overkill...

With Buildroot you can also build professional systems with very
advanced user-interface (by using Qt over framebuffer for example).
They will "only" need 32MBytes of RAM, fit on 16MBytes FLASH and boot in
less that 10 seconds. I'm not sure that OE can generate the same without
deeply hacking the beast.

Regards,
Julien
