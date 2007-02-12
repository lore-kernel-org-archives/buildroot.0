From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:06 -0800
Subject: [Buildroot] [buildroot 0000962]: device-mapper.1.02.08 is out
Message-ID: <afad53c3404157a35b926da38dc0a92c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=962 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   962
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-19-2006 12:12 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    device-mapper.1.02.08 is out
Description: 
that version isn't in the main dir anymore, only patch 05 and 08.
changing package/dm/dm.mk 

DM_PATCH=08

gets the newer one which compiles... no other testing has been done.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-19-06 16:54  
---------------------------------------------------------------------- 
updated dm.mk 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-19-06 12:12  bowerymarc     New Issue                                    
07-19-06 12:12  bowerymarc     Status                   new => assigned     
07-19-06 12:12  bowerymarc     Assigned To               => uClibc          
07-19-06 16:54  vapier         Note Added: 0001534                          
07-19-06 16:54  vapier         Status                   assigned => closed  
07-19-06 16:54  vapier         Resolution               open => fixed       
07-19-06 16:54  vapier         Summary                  No such file
`device-mapper.1.02.07.tgz'. => device-mapper.1.02.08 is out
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
