From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Mon, 5 Aug 2019 08:43:01 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: update pkg-kconfig doc about
 <pkg>-diff-config
Message-ID: <20190805064301.3261-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Briefly states what the output of this target is about.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 docs/manual/adding-packages-kconfig.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 982c1229ea..fa0bfd2b29 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -43,6 +43,11 @@ This snippet creates the following make targets:
   options that differ from the default values. It is not possible to
   use this target when fragment files are set.
 
+* +foo-diff-config+, which outputs differences between the current
+  configuration and the one obtained by merging the defconfig with all set
+  configuration fragment files. The output is useful to identify entries
+  that are not yet in any configuration fragment file.
+
 and ensures that the source configuration file is copied to the build
 directory at the right moment.
 
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
