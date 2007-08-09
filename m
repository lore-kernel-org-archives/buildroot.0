From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 8 Aug 2007 17:54:58 -0700
Subject: [Buildroot] [buildroot 0001457]: Sed commands in Qtopia build fail
	because of / delimiter and slash in strings
Message-ID: <9200c24d50f62e2bd338df5f7ffbf951@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             08-08-2007 17:54 PDT
Last Modified:              08-08-2007 17:54 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-07 17:54  adamhawes      New Issue                                    
08-08-07 17:54  adamhawes      Status                   new => assigned     
08-08-07 17:54  adamhawes      Assigned To               => buildroot       
======================================================================
