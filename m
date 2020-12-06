From: rob.r374 at gmail.com <rob.r374@gmail.com>
Date: Sun, 6 Dec 2020 12:31:05 +0100
Subject: [Buildroot] How to safely connect to remote embedded systems
 (mostly behind Firewalls) ?
Message-ID: <011701d6cbc3$49d7f7c0$dd87e740$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I'm preparing buildroot based distribution for ARM Cortex M7
(noMMU,STM32F769 DISCO board).

I'd like to implement possibility to remotely connect from distant server,
to check and supervise the system.

I think that >reverse shell< is what I'm looking for (so remote system on
some trigger connects safely to some distant server, from which I can work
in shell). I guess dropbear that is already present in my system could be
used for this.

 

Is this solution safe and how can be implemented efficiently on these
resource constrained devices ?

 

Thanks,

Regards,

Rob.



-- 
Ta e-po?ta je bila pregledana z Avast protivirusnim programom.
https://www.avast.com/antivirus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201206/d6666edf/attachment.html>
