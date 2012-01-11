From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 16:22:07 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <87lipe9sku.fsf@macbook.be.48ers.dk>
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
 <4F0D9B42.2070604@labri.fr> <87y5te9uxy.fsf@macbook.be.48ers.dk>
 <4F0D9D1E.7090406@labri.fr> <87lipe9sku.fsf@macbook.be.48ers.dk>
Message-ID: <4F0DA91F.3000403@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/01/2012 16:17, Peter Korsgaard a ?crit :
>>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> 
> Hi,
> 
>  Jigar> Yes I did keep this ^^.
>  Jigar> Here's the complete command line :
> 
>  Jigar> LB_MKLI_CMDLINE="console=ttyS2,38400 init=/bin/sh"
> 
> That doesn't seem to match your first mail:
> 
> # Put a getty on the serial port
> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
> 

Yep, sorry, I was just testing every ttySx at random. The command line
indeed was with ttyS0 of course, everything in kernel command/serial
console client/inittab/security is coherent with the ttySx I choose.

Same result with both.



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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/a61ba684/attachment.asc>
