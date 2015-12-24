From: =?UTF-8?Q?No=C3=A9_RUBINSTEIN?= <nrubinstein@aldebaran.com>
Date: Thu, 24 Dec 2015 10:21:00 +0100
Subject: [Buildroot] [PATCH v2 1/2] trousers: new package
In-Reply-To: <20151224084221.12044000@free-electrons.com>
References: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
 <20151224084221.12044000@free-electrons.com>
Message-ID: <CAOJKDvLfvzLSG5Z65BcKyE4DrA0nw9XA4aGrgw+uqJj+ss=K-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning Thomas,

Thanks a lot for all these fixes and for merging.

2015-12-24 8:42 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

>      - select libiconv when locale support is not available, otherwise the
>        build fails due to missing iconv.h
>      - disable on BR2_STATIC_LIBS configurations as it doesn't build. It
>        could be made to build by patching the trousers Makefile.
>      - add missing dependency on thread support in the toolchain
>

Are you running an automatic test set on your host machine to detect these
problems?


> Please monitor autobuild.buildroot.org in the coming days to see if
> there are any failures related to this new package.
>

I will do this.

Thanks again,
No?.

-- 




*This email and any attachment thereto are confidential and intended solely 
for the use of the individual or entity to whom they are addressed.If you 
are not the intended recipient, please be advised that disclosing, copying, 
distributing or taking any action in reliance on the contents of this email 
is strictly prohibited. In such case, please immediately advise the sender, 
and delete all copies and attachment from your system.This email shall not 
be construed and is not tantamount to an offer, an acceptance of offer, or 
an agreement by Aldebaran Robotics on any discussion or contractual 
document whatsoever. No employee or agent is authorized to represent or 
bind Aldebaran Robotics to third parties by email, or act on behalf of 
Aldebaran Robotics by email, without express written confirmation by 
Aldebaran Robotics? duly authorized representatives.*
------------------------------

*Ce message ?lectronique et ?ventuelles pi?ces jointes sont confidentiels, 
et exclusivement destin?s ? la personne ou l'entit? ? qui ils sont 
adress?s.*

*Si vous n'?tes pas le destinataire vis?, vous ?tes pri? de ne pas 
divulguer, copier, distribuer ou prendre toute d?cision sur la foi de ce 
message ?lectronique. Merci d'en aviser imm?diatement l'exp?diteur et de 
supprimer toutes les copies et ?ventuelles pi?ces jointes de votre syst?me.*

*Ce message ?lectronique n'?quivaut pas ? une offre, ? une acceptation 
d?offre, ou ? un accord d'Aldebaran Robotics sur toute discussion ou 
document contractuel quel qu?il soit, et ne peut ?tre interpr?t? comme tel. 
Aucun employ? ou agent d?Aldebaran Robotics n'est autoris? ? repr?senter ou 
? engager la soci?t? par email, ou ? agir au nom et pour le compte de la 
soci?t? par email, sans qu?une confirmation ?crite soit donn?e par le 
repr?sentant l?gal d?Aldebaran Robotics ou par toute autre personne ayant 
re?u d?l?gation de pouvoir appropri?e.*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151224/59abe049/attachment.html>
