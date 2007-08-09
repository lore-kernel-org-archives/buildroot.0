From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 8 Aug 2007 23:19:14 -0700
Subject: [Buildroot] [buildroot 0001457]: Sed commands in Qtopia build fail
	because of / delimiter and slash in strings
Message-ID: <e023e460774c7d9eb6a1bbce14c46135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              08-08-2007 23:19 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-07 17:54  adamhawes      New Issue                                    
08-08-07 17:54  adamhawes      Status                   new => assigned     
08-08-07 17:54  adamhawes      Assigned To               => buildroot       
08-08-07 23:19  hcegtvedt      Note Added: 0002652                          
======================================================================
