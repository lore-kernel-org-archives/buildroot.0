From: Pampolini Matteo <matteo.pampolini@leonardocompany.com>
Date: Wed, 9 Jan 2019 14:19:46 +0000
Subject: [Buildroot] Linux kernel module compilation with Buildroot
 generated toolchain
Message-ID: <1547043586247.60355@leonardocompany.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


my name is Matteo, I'm writing from Italy, I'm new to this mailing list but I've been using Buildroot for more than one year now,

it's a great framework!


I have a Linux kernel module that, for some reasons, cannot be integrated into Buildroot build chain as suggested by the user manual, then I need to compile it separately. As for all modules I need to point at kernel directory, but this cannot be found in

output/host directory, so as a temporary hack I used output/build/linux-* one.


However this implies that the generated toolchain cannot be used in a standalone way for such a build, while it would be nice

to have such a feature, just as Yocto generated SDK does.


What do you think about this? Is it possible to include the "devel" part of Linux kernel in a simple way? Moreover I was able to

generate a self-extracting toolchain, starting from output/host, through makeself package, to be distributed across my team,

that's why Linux kernel module compilation without the complete Buildroot tree would be very useful.


Many thanks in advance for your kind answers,


Matteo



Il presente messaggio e-mail e ogni suo allegato devono intendersi indirizzati esclusivamente al destinatario indicato e considerarsi dal contenuto strettamente riservato e confidenziale. Se non siete l'effettivo destinatario o avete ricevuto il messaggio e-mail per errore, siete pregati di avvertire immediatamente il mittente e di cancellare il suddetto messaggio e ogni suo allegato dal vostro sistema informatico. Qualsiasi utilizzo, diffusione, copia o archiviazione del presente messaggio da parte di chi non ne ? il destinatario ? strettamente proibito e pu? dar luogo a responsabilit? di carattere civile e penale punibili ai sensi di legge.
Questa e-mail ha valore legale solo se firmata digitalmente ai sensi della normativa vigente.
________________________________
The contents of this email message and any attachments are intended solely for the addressee(s) and contain confidential and/or privileged information.
If you are not the intended recipient of this message, or if this message has been addressed to you in error, please immediately notify the sender and then delete this message and any attachments from your system. If you are not the intended recipient, you are hereby notified that any use, dissemination, copying, or storage of this message or its attachments is strictly prohibited. Unauthorized disclosure and/or use of information contained in this email message may result in civil and criminal liability. ?
This e-mail has legal value according to the applicable laws only if it is digitally signed by the sender
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190109/d347eaa4/attachment.html>
