From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 15:30:54 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <87y5te9uxy.fsf@macbook.be.48ers.dk>
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
 <4F0D9B42.2070604@labri.fr> <87y5te9uxy.fsf@macbook.be.48ers.dk>
Message-ID: <4F0D9D1E.7090406@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/01/2012 15:26, Peter Korsgaard a ?crit :
>>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> 
>  >> Seems good. Can you interact with the shell over serial if you boot with
>  >> init=/bin/sh ?
>  >> 
> 
>  Jigar> Nope. It hangs on Booting Linux...and that's all. I can't do anything,
>  Jigar> can't type anything on keyboard.
> 
> You did keep the console=.. part, right? What is your entire kernel
> cmdline?
> 
Yes I did keep this ^^.
Here's the complete command line :

LB_MKLI_CMDLINE="console=ttyS2,38400 init=/bin/sh"


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/b6d90e27/attachment-0001.asc>
