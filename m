From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:09 -0800
Subject: [Buildroot] [buildroot 0000216]: mkfs.jffs2
Message-ID: <34d6bd290455b24c550669491201fdd4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=216 
====================================================================== 
Reported By:                hermannb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   216
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-07-2005 00:33 PDT
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    mkfs.jffs2
Description: 
There is a missing \ at the end of line 49 of the makefile
buildroot/target/jffs2/jffs2root.mk
to concatenate the lines.


====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-12-05 12:49  
---------------------------------------------------------------------- 
This was fixed with revision 10077 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-07-05 00:33  hermannb       New Issue                                    
04-12-05 12:49  andersen       Note Added: 0000143                          
04-12-05 12:49  andersen       Status                   assigned => closed  
04-12-05 12:49  andersen       Resolution               open => fixed       
04-12-05 12:49  andersen       Description Updated                          
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
