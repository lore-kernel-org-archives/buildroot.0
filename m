From: =?UTF-8?Q?No=C3=A9_RUBINSTEIN?= <nrubinstein@aldebaran.com>
Date: Tue, 3 Feb 2015 10:43:37 +0100
Subject: [Buildroot] [PATCH 1/3] fs/iso9660: allow building a hybrid ISO
	image
In-Reply-To: <CAAXf6LX9wcAVKwxHQYg2Ld7J+Ls36A+ZOFwdWwyLSkLsEkR9Rg@mail.gmail.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
 <CAAXf6LX9wcAVKwxHQYg2Ld7J+Ls36A+ZOFwdWwyLSkLsEkR9Rg@mail.gmail.com>
Message-ID: <CAOJKDvJR6jdHuQMq14GyRQDihSFEs-OMD+QDBSb8XRt7dBov9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for your review.

2015-02-02 21:39 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> > +config BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
> > +       bool "Use a custom boot config file"
> > +       depends on BR2_TARGET_ROOTFS_ISO9660
>
> There should be some help text on this option: what is the format of
> the config file, what is the default one, ... ?

This is a bool option, and when toggled it shows option
BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG which has a visible default
value. Should I add a link to
http://www.syslinux.org/wiki/index.php/Isolinux.cfg and
http://www.gnu.org/software/grub/manual/html_node/Configuration.html ?

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
