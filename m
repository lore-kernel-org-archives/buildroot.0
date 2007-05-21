From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 May 2007 12:52:37 -0700
Subject: [Buildroot] [buildroot 0001363]: buildroot pciutils pciutils.mk
	doesn't clean the .compiled flag
Message-ID: <4c8e92c88125954841b00e9acf44f6a3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1363 
====================================================================== 
Reported By:                bobwired
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1363
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-21-2007 12:52 PDT
Last Modified:              05-21-2007 12:52 PDT
====================================================================== 
Summary:                    buildroot pciutils pciutils.mk  doesn't clean the
.compiled flag
Description: 
The pciutils.mk file does not remove the .compiled flag when the pciutls is
cleaned. Thereafter, the buildroot make will fail, until the .compiled file
is removed. Removing the .compiled file in the clean target fixes this.

Patch file attached.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-21-07 12:52  bobwired       New Issue                                    
05-21-07 12:52  bobwired       Status                   new => assigned     
05-21-07 12:52  bobwired       Assigned To               => buildroot       
05-21-07 12:52  bobwired       File Added: mypatch                          
======================================================================
