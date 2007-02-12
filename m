From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:15 -0800
Subject: [Buildroot] [buildroot 0000968]: readline inclusion into target
	image [patch to enable this]
Message-ID: <90079b642a23b9d913294c4274f92be4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=968 
====================================================================== 
Reported By:                rhunger
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   968
Category:                   New Features
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-24-2006 03:10 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    readline inclusion into target image [patch to
enable this]
Description: 
The readline libraries are only installed into the staging directory not
the target root filesystem. The infrastructure present in
package/readline/readline.mk is not used/enabled. The attached patch
enables the make rule readline-target with some minor tweaks.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-24-06 03:10  rhunger        New Issue                                    
07-24-06 03:10  rhunger        Status                   new => assigned     
07-24-06 03:10  rhunger        Assigned To               => uClibc          
07-24-06 03:10  rhunger        File Added:
readline-target_for_buildroot-20060120.patch                    
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
