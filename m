From: Marcel Patzlaff <M.Patzlaff@pilz.de>
Date: Tue, 15 Jan 2019 11:19:45 +0100
Subject: [Buildroot] Migration to OpenSSL 1.1.1?
Message-ID: <OFCE363AB5.EB39827A-ONC1258383.0037AF48-C1258383.0038BD5C@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

after reading https://www.openssl.org/source/ (especially the part where 
the version support is stated), the following question pops up:
Are there plans to migrate the openssl package to 1.1.1?
Not long ago, a switch was introduced to drop-in replace openssl with 
libressl (which has OpenSSL 1.0.1 API compatibility).
Are there reasons for this?
Or are there problems with OpenSSL 1.1.1 which I do not know about yet?

Kind regards,
Marcel

-- 


Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
