From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Mon, 06 Feb 2012 20:43:45 +0100
Subject: [Buildroot] Buildroot networking problems
Message-ID: <4F302D71.9020308@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've built a Buildroot Linux on a Leon3 CPU, everything works fine
except the network configuration.

I have the eth0 interface configured correctly with a default gw,
netmask etc...but when I ping the interface adress itself, it doesnt
respond at all.

I've also tried to ping 127.0.0.1, same result, lo is not responding.
(I have read some posts on resolv.conf but in my case, it is not a dns
related issue, I ping numerical adresses..)

Any idea on what is going wrong ?

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120206/9137ca0c/attachment.asc>
