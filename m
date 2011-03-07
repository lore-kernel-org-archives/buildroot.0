From: Daniele Salvatore Albano - Lavoro <info@daccii.it>
Date: Mon, 07 Mar 2011 20:42:28 +0100
Subject: [Buildroot] Conditional patches (php package)
Message-ID: <4D753524.5050306@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,

i'm trying to add support for php 5.3(.5), mantaining the ability to 
compile php 5.2(.17) for compatibility reasons.

The main problem is a patch that is in php 5.3.5 sources but not in 
5.2.17 sources so it needed to be applied conditionally.

The, only one, patch is 
php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch 
and it seems related to an extension (gmp in the name).

Can someone give me an hint?


Thank you,

Best Regards,
Daniele

-- 
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.daccii.it
  Website Design and Development         |
  Software Engineer and Developer        | e-mail:
  Linux Servers SetUp And Administration | info at daccii.it
  Embedded Network Solutions             | d.albano at gmail.com

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
