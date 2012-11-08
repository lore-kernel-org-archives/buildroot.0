From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Thu, 08 Nov 2012 11:52:39 +0100
Subject: [Buildroot] [PATCH v2] package: add bcusdk
In-Reply-To: <509B6EA8.3090605@mind.be>
References: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352192728-4816-2-git-send-email-gregory.hermant@calao-systems.com>
 <509B6EA8.3090605@mind.be>
Message-ID: <509B8EF7.9090809@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 08/11/2012 09:34, Arnout Vandecappelle a ?crit :
>> diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
>> new file mode 100644
>> index 0000000..c7b1b95
>> --- /dev/null
>> +++ b/package/bcusdk/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_BCUSDK
>> +    bool "bcusdk"
>> +    depends on BR2_INSTALL_LIBSTDCPP
>> +    select BR2_PACKAGE_LIBPTHSEM
> 
>  ... and the architecture dependencies of libpthsem...

Could you please enlighten me on this point ?

BR,
gregory



CALAO SYSTEMS <http://www.calao-systems.com/>


*CALAO SYSTEMS*
Le Magist?re II
334, rue des Vingt Toises
38950 Saint Martin le Vinoux
France
Phone : *+33 (0)4 76 56 38 05*
Fax     : *+33 (0)4 76 56 38 06*

Cette communication (y compris les pi?ces jointes) est r?serv?e ? l'usage exclusif du destinataire (des destinataires) et peut contenir des informations privil?gi?es, confidentielles, exempt?es de
divulgation selon la loi ou prot?g?es par les droits d'auteur. Si vous n'?tes pas un destinataire, toute utilisation, divulgation, distribution, reproduction, examen ou copie (totale ou partielle) est
non-autoris?e et peut ?tre ill?gale. Tout message ?lectronique est susceptible d'alt?ration et son int?grit? ne peut ?tre assur?e. CALAO SYSTEMS d?cline toute responsabilit? au titre de ce message
s'il a ?t? modifi? ou falsifi?. Si vous n'?tes pas destinataire de ce message, merci de le d?truire imm?diatement et d'avertir l'exp?diteur de l'erreur de distribution et de la destruction du message.
Merci.

This transmission (including any attachments) is intended solely for the use of the addressee(s) and may contain confidential information including trade secrets which are privileged, confidential,
exempt from disclosure under applicable law and/or subject to copyright. If you are not an intended recipient, any use, disclosure, distribution, reproduction, review or copying (either whole or
partial) is unauthorized and may be unlawful. E-mails are susceptible to alteration and their integrity cannot be guaranteed. CALAO SYSTEMS shall not be liable for this e-mail if modified or
falsified. If you are not the intended recipient of this e-mail, please delete it immediately from your system and notify the sender of the wrong delivery and the mail deletion. Thank you.
