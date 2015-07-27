From: =?UTF-8?Q?No=C3=A9_RUBINSTEIN?= <nrubinstein@aldebaran.com>
Date: Mon, 27 Jul 2015 11:24:16 +0200
Subject: [Buildroot] [PATCHv2 13/15] fs/iso9660: add hybrid image support
In-Reply-To: <1433802108-14351-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAOJKDvKk2uRb8nr3fVUubnd26CUn=n2XH60YMSYLzQukAnN5PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Sorry for the late answer.

2015-06-09 0:21 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
> +define ROOTFS_ISO9660_GEN_HYBRID
> +       $(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
> +endef
> +
> +ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID

My understanding is that _POST_GEN_HOOKS has been skipped in the v2
patch series, so this does not work. Is that correct?

Regards,
No? Rubinstein.

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
