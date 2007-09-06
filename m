From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Sep 2007 11:28:04 -0700
Subject: [Buildroot] [buildroot 0001492]: filter-out does not work when
	making buildroot
Message-ID: <e5b74636a6a849f5f3f2f0f0cb14fa45@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1492 
====================================================================== 
Reported By:                alisonken1
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1492
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-06-2007 11:28 PDT
Last Modified:              09-06-2007 11:28 PDT
====================================================================== 
Summary:                    filter-out does not work when making buildroot
Description: 
When making buildroot, compiling dies when strip is called on gccbug.
gccbug is a shell script and strip dies with 'file format unrecognized'.

Looking at makefile, strip is called with $(filter-out gccbug ...). but
gccbug is not filtered out of the strip process.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-06-07 11:28  alisonken1     New Issue                                    
09-06-07 11:28  alisonken1     Status                   new => assigned     
09-06-07 11:28  alisonken1     Assigned To               => buildroot       
======================================================================
