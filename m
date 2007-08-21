From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 21 Aug 2007 04:46:35 -0700
Subject: [Buildroot] [buildroot 0001457]: Sed commands in Qtopia build fail
	because of / delimiter and slash in strings
Message-ID: <976beef275e4aa9aab260d37a087ebc2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1457 
====================================================================== 
Reported By:                adamhawes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1457
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-08-2007 17:54 PDT
Last Modified:              08-21-2007 04:46 PDT
====================================================================== 
Summary:                    Sed commands in Qtopia build fail because of /
delimiter and slash in strings
Description: 
The qtopia4 makefile uses a number of substitute commands with slash
delimiters in sed to fix the build process.  Some of the commands include
pathnames with slash characters that break sed.  I have build a patch that
repalces the slash delimiters with pipe characters that resolves the
problem.
====================================================================== 

---------------------------------------------------------------------- 
 hcegtvedt - 08-08-07 23:19  
---------------------------------------------------------------------- 
I submitted a fix for this earlier (and some other stuff) on the mailing
list, please see
http://buildroot.uclibc.org/lists/buildroot/2007-August/004197.html 

---------------------------------------------------------------------- 
 bernhardf - 08-21-07 04:46  
---------------------------------------------------------------------- 
This was fixed around r19604. Thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-07 17:54  adamhawes      New Issue                                    
08-08-07 17:54  adamhawes      Status                   new => assigned     
08-08-07 17:54  adamhawes      Assigned To               => buildroot       
08-08-07 23:19  hcegtvedt      Note Added: 0002652                          
08-21-07 04:46  bernhardf      Status                   assigned => closed  
08-21-07 04:46  bernhardf      Note Added: 0002673                          
======================================================================
