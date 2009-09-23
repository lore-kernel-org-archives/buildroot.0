From: Cavalera Claudio Luigi <Claudio.Cavalera@italtel.it>
Date: Wed, 23 Sep 2009 15:24:12 +0200
Subject: [Buildroot] "mconf cannot execute binary file " ??
Message-ID: <A2167AE7633A5C4DAE56EEBD1428ECC0F3612F@BESONE.corp.dom>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,
my name is Claudio and I'm new on the list.
I'm trying to learn buildroot, in the past I've been successful using
scratchbox but now I want to try buildroot which should be better for my
MIPS target architecture.

As far as I've understood the only documentation available is this one:
http://www.buildroot.net/buildroot.html
is this correct?

Wanting to start with something stable, I've downloaded the tarballs but
when I issue make menuconfig
it complains about 'mconf' 
/bin/sh: package/config/mconf: cannot execute binary file

it seems a MIPS file:
file package/config/mconf
package/config/mconf: ELF 32-bit MSB executable, MIPS, MIPS-I version 1
(SYSV), dynamically linked (uses shared libs), not stripped

It seems impossible to me that such a problem made into the buildroot
release because it would have been reported by many others also but I
found nothing about it.

So chances are that it's a problem of my environment or something I'm
doing (but it's just an untar and a make menuconfig).
Is it ok to run make menuconfig on an x86 build host?
Maybe it's better to use the latest git instead of the tarballs?

Thanks a lot,
Claudio


Internet Email Confidentiality Footer
-----------------------------------------------------------------------------------------------------
La presente comunicazione, con le informazioni in essa contenute e ogni documento o file allegato, e' rivolta unicamente alla/e persona/e cui e' indirizzata ed alle altre da questa autorizzata/e a riceverla. Se non siete i destinatari/autorizzati siete avvisati che qualsiasi azione, copia, comunicazione, divulgazione o simili basate sul contenuto di tali informazioni e' vietata e potrebbe essere contro la legge (art. 616 C.P., D.Lgs n. 196/2003 Codice in materia di protezione dei dati personali). Se avete ricevuto questa comunicazione per errore, vi preghiamo di darne immediata notizia al mittente e di distruggere il messaggio originale e ogni file allegato senza farne copia alcuna o riprodurne in alcun modo il contenuto. 

This e-mail and its attachments are intended for the addressee(s) only and are confidential and/or may contain legally privileged information. If you have received this message by mistake or are not one of the addressees above, you may take no action based on it, and you may not copy or show it to anyone; please reply to this e-mail and point out the error which has occurred. 
-----------------------------------------------------------------------------------------------------
