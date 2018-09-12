From: Florian La Roche <F.LaRoche@pilz.de>
Date: Wed, 12 Sep 2018 14:40:15 +0200
Subject: [Buildroot] Antwort: Re: [PATCH 1/1] package/mongodb: add patch to
 compile with glibc >= 2.28
In-Reply-To: <20180912105228.1c0ec200@windsurf>
References: <20180912083447.5169-1-F.LaRoche@pilz.de>
 <20180912105228.1c0ec200@windsurf>
Message-ID: <OF8D5A4992.EF086515-ONC1258306.004559C1-C1258306.00459A8D@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> schrieb am 12.09.2018 
10:52:28:
> Since mongodb upstream is maintained in Git, we like to have a Git
> formatted patch. So could you instead clone
> https://github.com/mongodb/mongo.git, checkout the 3.3.4 tag, make the
> fix, do a commit, and then "git format-patch HEAD^", and use the
> generated 0001 file ?

The github repo only contains v3.4 and newer, but buildroot is currently 
using 3.3.4.

Can you commit my original patch or any other idea on how to submit this 
change?

best regards,

Florian La Roche



Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180912/bb3c1f35/attachment.html>
