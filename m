From: Florian La Roche <F.LaRoche@pilz.de>
Date: Tue, 29 May 2018 10:57:23 +0200
Subject: [Buildroot] thumb_swp/thumb_swpb
Message-ID: <OFABB7D2C6.FB3C2E32-ONC125829C.002F0CD2-C125829C.00313300@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello uclibc-ng/buildroot developers,

compiling buildroot with thumb-instructions and gcc-8.1 results in an 
error
due to the swp{,b} assembler instruction. Searching within buildroot, this
thumb_swp* function is never used anywhere (but this is a very limited 
search).
The add commit message for this refers to other libraries using this 
function, but
no real specific data. Maybe this can be removed altogether?

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180529/2e4f6529/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-swp.patch
Type: application/octet-stream
Size: 484 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180529/2e4f6529/attachment.obj>
