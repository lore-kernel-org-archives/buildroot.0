From: Daniele Salvatore Albano <info@daccii.it>
Date: Tue, 12 Apr 2011 19:22:49 +0200
Subject: [Buildroot] Conditional patches (php package)
In-Reply-To: <4DA485F8.4080608@zacarias.com.ar>
References: <4D753524.5050306@daccii.it> <4DA485F8.4080608@zacarias.com.ar>
Message-ID: <4DA48A69.10603@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 12/04/2011 19:03, Gustavo Zacarias ha scritto:
 > Hi Daniele.
 > Did you move forward with the php bump?
 > I wouldn't mind dropping the 5.2 series for two reasons:
 >
 > * We don't need to maintain any compatibility
 > * Upstream EOL - no more security updates
 >
 > So i'd say just go forward with 5.3.x...
 > Regards.

Yes i bumped it, but i didn't posted the patch yet because i need to fix 
some stuff i was working on (not related to php) to send some patches.

While support only php 5.3 would be "wonderful", i think that support 
php 5.2 isin't bad because a lot of old code doesn't work well with php 5.3

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
