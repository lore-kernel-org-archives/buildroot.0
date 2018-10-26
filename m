From: Marcel Patzlaff <M.Patzlaff@pilz.de>
Date: Fri, 26 Oct 2018 08:03:59 +0200
Subject: [Buildroot] Antwort: Re: Antwort: Re: [PATCH v3] merge_config.sh:
 merge also buildroot config files
In-Reply-To: <20181025214311.GB31691@dell5510>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
 <20181025074309.GB18528@dell5510>
 <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
 <20181025214311.GB31691@dell5510>
Message-ID: <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

> Looking in the code uclibc-ng uses several prefixes: CONFIG_, TARGET_, 
UCLIBC_
> and sometimes even configs without prefix: VERSION, WARNINGS, 
> EXTRA_WARNINGS [1].
> 
> But their SED_CONFIG_EXP uses also CONFIG_.

As you said, they use several prefixes. IMHO, it does not make sense to
filter out configuration items based on a prefix.
And BTW, uclibc does not use it's own merge_config.sh anywhere and I
assume that it is also not used elsewhere.

I would suggest to just remove the prefix restrictions in buildroot's
merge_config.sh unless someone can tell why they are important to be
there.

Kind regards,
Marcel

PS: Sorry for the second reply. My mailclient dropped the list...

-- 

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
