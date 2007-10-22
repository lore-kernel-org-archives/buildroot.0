From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 22 Oct 2007 14:17:51 -0700
Subject: [Buildroot] [buildroot 0001548]: llseek.c:65: error: expected
	declaration specifiers or '...' before '_llseek'
Message-ID: <502714cbafa8b46e2a5948563c2b8828@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1548 
====================================================================== 
Reported By:                Steve Cornett
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1548
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2007 14:17 PDT
Last Modified:              10-22-2007 14:17 PDT
====================================================================== 
Summary:                    llseek.c:65: error: expected declaration specifiers
or '...' before '_llseek'
Description: 
Configure for ARM.  Failure is:

        CC llseek.c
llseek.c:65: error: expected declaration specifiers or '...' before
'_llseek'

See attached Config.in and makeLog.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-07 14:17  Steve Cornett  New Issue                                    
10-22-07 14:17  Steve Cornett  Status                   new => assigned     
10-22-07 14:17  Steve Cornett  Assigned To               => buildroot       
10-22-07 14:17  Steve Cornett  File Added: InputAndOutput.tar                   

======================================================================
