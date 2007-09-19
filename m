From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:07:06 -0700
Subject: [Buildroot] [buildroot 0001492]: filter-out does not work when
	making buildroot
Message-ID: <72ff85123e8cf2b73c96c1ab46a2e3d2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-06-2007 11:28 PDT
Last Modified:              09-19-2007 07:07 PDT
====================================================================== 
Summary:                    filter-out does not work when making buildroot
Description: 
When making buildroot, compiling dies when strip is called on gccbug.
gccbug is a shell script and strip dies with 'file format unrecognized'.

Looking at makefile, strip is called with $(filter-out gccbug ...). but
gccbug is not filtered out of the strip process.

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:07  
---------------------------------------------------------------------- 
This was fixed some time ago. Do a svn up. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-06-07 11:28  alisonken1     New Issue                                    
09-06-07 11:28  alisonken1     Status                   new => assigned     
09-06-07 11:28  alisonken1     Assigned To               => buildroot       
09-19-07 07:07  bernhardf      Status                   assigned => closed  
09-19-07 07:07  bernhardf      Note Added: 0002755                          
======================================================================
