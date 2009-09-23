From: Cavalera Claudio Luigi <Claudio.Cavalera@italtel.it>
Date: Wed, 23 Sep 2009 16:28:14 +0200
Subject: [Buildroot] "mconf cannot execute binary file " ??
In-Reply-To: <A2167AE7633A5C4DAE56EEBD1428ECC0F3612F@BESONE.corp.dom>
Message-ID: <A2167AE7633A5C4DAE56EEBD1428ECC0F36132@BESONE.corp.dom>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot-bounces at busybox.net wrote:
> Wanting to start with something stable, I've downloaded the tarballs
but
> when I issue make menuconfig
> it complains about 'mconf' 
> /bin/sh: package/config/mconf: cannot execute binary file

Please ignore this problem,
I've found it I was issuing
make menuconfig
from a shell environment with all variables messed up so there was
already a MIPS cross compiler in the path!!
I've cleaned up the shell environment and now make menuconfig works!

Regards,
Claudio


Internet Email Confidentiality Footer
-----------------------------------------------------------------------------------------------------
La presente comunicazione, con le informazioni in essa contenute e ogni documento o file allegato, e' rivolta unicamente alla/e persona/e cui e' indirizzata ed alle altre da questa autorizzata/e a riceverla. Se non siete i destinatari/autorizzati siete avvisati che qualsiasi azione, copia, comunicazione, divulgazione o simili basate sul contenuto di tali informazioni e' vietata e potrebbe essere contro la legge (art. 616 C.P., D.Lgs n. 196/2003 Codice in materia di protezione dei dati personali). Se avete ricevuto questa comunicazione per errore, vi preghiamo di darne immediata notizia al mittente e di distruggere il messaggio originale e ogni file allegato senza farne copia alcuna o riprodurne in alcun modo il contenuto. 

This e-mail and its attachments are intended for the addressee(s) only and are confidential and/or may contain legally privileged information. If you have received this message by mistake or are not one of the addressees above, you may take no action based on it, and you may not copy or show it to anyone; please reply to this e-mail and point out the error which has occurred. 
-----------------------------------------------------------------------------------------------------
