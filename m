From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 14:18:51 +0100
Subject: [Buildroot] Fwd: Re: Cant type anything into Serial Console
	login
In-Reply-To: <69d6daaa-60fe-42e2-9ecf-7017d0e35ce7@email.android.com>
References: <69d6daaa-60fe-42e2-9ecf-7017d0e35ce7@email.android.com>
Message-ID: <4F0D8C3B.6030100@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just found how to disable hardware/software control using minicom. So,
I disabled both. Same problem : I can't type anything at the login prompt.

Is there any particular configuration that I might miss ? Parity ? Stop
bits? Anything else? Is this comming from the Linux/BusyBox or from the
Serial console program ? Any clues of any kind please folks ?

Thanks.



Le 11/01/2012 13:12, Jigar SOLANKI a ?crit :
> 
> -- 
> Jigar SOLANKI
> 
> Envoy? de mon smartphone Android avec K-9 Mail. Excusez la brievet?.
> 
> 
> Jigar SOLANKI <jigar.solanki@labri.fr> a ?crit :
> 
>     Thanks for the quick reply. What is hardware flow control and how to
>     disable it? Didnt know that feature.
>     -- 
>     Jigar SOLANKI
> 
>     Envoy? de mon smartphone Android avec K-9 Mail. Excusez la brievet?.
> 
> 
>     Will Newton <will.newton@gmail.com> a ?crit :
> 
>         On Wed, Jan 11, 2012 at 11:46 AM, Jigar SOLANKI <jigar.solanki@labri.fr> wrote:
>         > Hi all and happy new year :-)
>         >
>         > I'm trying to build a Linux Environment using buildroot on a Leon3
>         > architecture.
>         >
>         > I've managed to compile and successfully run the Linux image with
>         > initramfs.
>         > At boot prompt, welcomme tobuildroot, buildroot login, I can't type
>         > anything in there. The serial console client (I've tried Kermit,
>         > Minicom, GTKTerm) just hangs, my keyboard is useless at that time.
>         >
>         > For what I have googled, I already checked the following :
>         >
>         > 1- the kernel command line (console=/dev/ttyS0,115200)
>         >
>         > 2- and also checked in target options->generic serial config->put a
>         > getty on ttyS0, 115200.
> 
>         Have you made sure to disable hardware fl
>          ow
>         control?
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/e7635110/attachment.asc>
