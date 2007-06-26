From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Jun 2007 07:07:59 -0700
Subject: [Buildroot] [buildroot 0000666]: openntpd init script and version
	bump
Message-ID: <7c744040126d0c9105e7e3b2ea7d057d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been set as DUPLICATE OF issue 0000445. 
====================================================================== 
http://busybox.net/bugs/view.php?id=666 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   666
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-27-2006 16:07 PST
Last Modified:              06-26-2007 07:07 PDT
====================================================================== 
Summary:                    openntpd init script and version bump
Description: 
This patch does these things:
(1) bump version from 3.6p1 to 3.7p1
(2) fix TARGET_BINARY var (was foo)
(3) add an init script
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0000445 [patch openntpd] Fix build, add init sc...
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-27-06 16:07  akvadrako      New Issue                                    
01-27-06 16:07  akvadrako      Status                   new => assigned     
01-27-06 16:07  akvadrako      Assigned To               => uClibc          
01-27-06 16:07  akvadrako      File Added: br-openntp-sysvinit-v2.patch         
          
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
06-26-07 07:07  bernhardf      Relationship added       duplicate of 0000445
======================================================================
