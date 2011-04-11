From: Daniele Salvatore Albano <info@daccii.it>
Date: Mon, 11 Apr 2011 23:20:30 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <4DA369FA.8050505@michaelburghart.de>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de>
Message-ID: <4DA3709E.7070005@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 11/04/2011 22:52, Michael Burghart ha scritto:
> I set this in .config:
>
> BR2_ROOTFS_SKELETON_CUSTOM=y
> BR2_ROOTFS_SKELETON_CUSTOM_PATH="/Save/buildroot-2011.02/fs/skeleton"
>
>
> but it's not used! I made special directories and files in the
> fs/skeleton but they are nowhere to be seen. What do I have to do to
> make them visible??

You need to do a full rebuild or just copy changed/updated files to the 
target directory (target) and rebuild/regenerate filesystems

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
