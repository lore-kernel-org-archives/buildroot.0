From: Patzlaff, Marcel <m.patzlaff@pilz.de>
Date: Wed, 27 Jan 2021 07:16:27 +0000
Subject: [Buildroot] Question: What is the intention of BR2_LOCALVERSION?
Message-ID: <AM0P194MB0612EAA1E850240102B16CF68BBB0@AM0P194MB0612.EURP194.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

yesterday I stumbled upon the issue, that information about our version control (Git: tag, commit count and hash) is compiled into our cross-gcc (which we create with Buildroot).
So I eventually found, that the cause for this is BR2_LOCALVERSION. Now the question: What is the intended purpose for this?

In our project we include Buildroot via release archive in a sub-folder below our version control. So it currently picks up tag information from our surrounding VCS where I would expect it to stay empty. Or to rephrase that: my expectation is, that BR2_VERSION_FULL contains the version information about Buildroot and not something about our VCS.

Kind regards,
Marcel

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849

This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.

Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
