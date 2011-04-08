From: Daniele Salvatore Albano <info@daccii.it>
Date: Fri, 08 Apr 2011 15:15:24 +0200
Subject: [Buildroot] Apache CrossCompile recipe
In-Reply-To: <4D9F0483.7000001@michaelburghart.de>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>	<4D9D5B9D.8090508@michaelburghart.de>
	<4D9D6EDE.7050004@daccii.it>	<4D9D6F6B.6000801@michaelburghart.de>	<4D9D7131.3090705@itechcon.it>	<4D9D73C1.1070408@michaelburghart.de>	<4D9D75DB.2010005@itechcon.it>	<4D9D775A.5010506@michaelburghart.de>	<4D9D7EE5.6060200@itechcon.it>	<4D9DE9B2.1000100@michaelburghart.de>	<4D9DFE83.3080602@itechcon.it>	<4D9E5FAD.8020408@michaelburghart.de>
	<4D9EFFBE.70308@itechcon.it> <4D9F0483.7000001@michaelburghart.de>
Message-ID: <4D9F0A6C.2050104@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 08/04/2011 14:50, Michael Burghart ha scritto:
> the build host is a x64 system
>
> Linux einstein 2.6.37.1-1.2-desktop #1 SMP PREEMPT 2011-02-21 10:34:10
> +0100 x86_64 x86_64 x86_64 GNU/Linux
>
> I am about to compile it for GeodeLX Arch.

I use nginx with php on that board (2D13) without any problem, but my 
build host isn't 64 bit.

I can't test it directly, however in this weekend i'll try to give a 
look to this problem.

In any case, you can try to edit auto/types/sizeof and add there 
u_int64_t size (well, it should be 8)

Best Regards,
Daniele

-- 
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.itechcon.it
  Website Design and Development         |
  Software Engineer and Developer        | e-mail:
  Linux Servers SetUp And Administration | info at itechcon.it
  Embedded Network Solutions             | d.albano at itechcon.it

Ai sensi del D.Lgs. 196/2003 si precisa che le informazioni contenute in 
questo messaggio sono riservate ed a uso esclusivo del destinatario. 
Qualora il messaggio in parola Le fosse pervenuto per errore, La 
invitiamo ad eliminarlo senza copiarlo e a non inoltrarlo a terzi, 
dandocene gentilmente comunicazione. Grazie.
Pursuant to Legislative Decree No. 196/2003, you are hereby informed 
that this message contains confidential information intended only for 
the use of the addressee. If you are not the addressee, and have 
received this message by mistake, please delete it and immediately 
notify us. You may not copy or disseminate this message to anyone. Thank 
you.
