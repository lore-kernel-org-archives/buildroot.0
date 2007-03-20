From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 07:42:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070320144243.246EF4801E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 07:42:42 -0700 (Tue, 20 Mar 2007)
New Revision: 18178

Log:
- add some ARM 1176 variants


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-03-20 14:19:37 UTC (rev 18177)
+++ trunk/buildroot/Config.in	2007-03-20 14:42:42 UTC (rev 18178)
@@ -73,6 +73,10 @@
 	bool "arm926t"
 config BR2_arm1136jf_s
 	bool "arm1136jf_s"
+config BR2_arm1176jz_s
+	bool "arm1176jz-s"
+config BR2_arm1176jzf_s
+	bool "arm1176jzf-s"
 config BR2_sa110
 	bool "sa110"
 config BR2_sa1100
@@ -92,6 +96,8 @@
 	default ARM922T		if BR2_arm922t
 	default ARM926T		if BR2_arm926t
 	default ARM1136JF_S 	if BR2_arm1136jf_s
+	default ARM1176JZ_S	if BR2_arm1176jz_s
+	default ARM1176JZF_S	if BR2_arm1176jzf_s
 	default ARM_SA110	if BR2_sa110
 	default ARM_SA1100	if BR2_sa1100
 	default ARM_XSCALE	if BR2_xscale
