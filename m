From: Daniele Salvatore Albano <info@daccii.it>
Date: Sun, 13 Mar 2011 13:50:22 +0100
Subject: [Buildroot] Really weird problem with login/passwd when using ttyS0
Message-ID: <4D7CBD8E.20209@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i've a really weird problem with login and passwd when using ttyS0: when 
i hit the return key (enter) it doesn't do absolutly anything.

---
~ # passwd
Changing password for root
New password:
passwd: password for root is unchanged
---

I need to kill the process using CTRL+C

If i connect using SSH, all works fine.

I'm using buildroot from git and busybox 1.18.3.

Busybox config file here
http://pastebin.com/nLyFPwbx

Buildroot config file here
http://pastebin.com/d2e0Krf4

I tried to redo anything from scratch, but the problem remains :\

Someone can give an hint?


Best Regards,
Daniele Salvatore Albano
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
