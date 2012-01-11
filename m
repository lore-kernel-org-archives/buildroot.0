From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 15:22:58 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <8739bmbb3o.fsf@macbook.be.48ers.dk>
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
Message-ID: <4F0D9B42.2070604@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/01/2012 14:52, Peter Korsgaard a ?crit :
>>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> 
> Hi,
> 
>  Jigar> 1- the kernel command line (console=/dev/ttyS0,115200)
> 
>  Jigar> 2- and also checked in target options->generic serial config->put a
>  Jigar> getty on ttyS0, 115200.
> 
>  Jigar> 3- I checked the inittab :
> 
>  Jigar> # Set up a couple of getty's
>  Jigar> tty1::respawn:/sbin/getty 115200 tty1
>  Jigar> tty2::respawn:/sbin/getty 115200 tty2
> 
>  Jigar> # Put a getty on the serial port
>  Jigar> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
> 
>  Jigar> 4- and I checked the /etc/securetty file too (ttyS0 is there).
> 
>  Jigar> What am I missing here?
> 
> Seems good. Can you interact with the shell over serial if you boot with
> init=/bin/sh ?
> 

Nope. It hangs on Booting Linux...and that's all. I can't do anything,
can't type anything on keyboard.


-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69
Web   : http://www.labri.fr/perso/solanki

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/f3e72b15/attachment.asc>
