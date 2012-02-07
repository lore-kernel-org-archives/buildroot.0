From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Tue, 07 Feb 2012 15:35:36 +0100
Subject: [Buildroot] Buildroot networking problems
In-Reply-To: <20120207135404.GB3690@tarshish>
References: <4F302D71.9020308@labri.fr> <87ipjjvgtg.fsf@macbook.be.48ers.dk>
 <4F3126EB.8000409@labri.fr> <20120207135404.GB3690@tarshish>
Message-ID: <4F3136B8.9020004@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Please send the output of 'iptables -L -n'.

I tried with and without iptables support.

Here's the ouput with :
> # iptables -L -n
modprobe: chdir(/lib/modules): No such file or directory
iptables v1.4.10: can't initialize iptables table `filter': Table does
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
#


> baruch
> 


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120207/453237b4/attachment.asc>
