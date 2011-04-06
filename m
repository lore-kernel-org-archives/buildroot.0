From: Daniele Salvatore Albano <info@daccii.it>
Date: Wed, 06 Apr 2011 13:01:02 +0200
Subject: [Buildroot] [HALd] Slow startup (>4min.)
In-Reply-To: <1302085372.4891.80.camel@esp-patben-lin.espdx1.local>
References: <1301995387.4891.40.camel@esp-patben-lin.espdx1.local>	<20110405215703.19ccce2e@surf>
	<1302085372.4891.80.camel@esp-patben-lin.espdx1.local>
Message-ID: <4D9C47EE.5050105@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 06/04/2011 12:22, Patryk Benderz ha scritto:
> Auto mounting USB storage (usbmount does not seem to work, and there is
> no info in any log files about it)

You can try to use udev to obtain the same result: write an sh script 
that handle device mounting when called by udev.

Look here for more info on udev rules for usb automounting:
http://www.novell.com/coolsolutions/tip/17785.html (on the bottom of the 
page there is a really simple rule)
http://www.debianhelp.org/node/9937#comment-46659
https://wiki.archlinux.org/index.php/Udev#Auto_mounting_USB_devices (the 
most useful i think)

Hope this helps.

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
