From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 8 Dec 2007 08:09:45 -0800
Subject: [Buildroot] [buildroot 0001664]: error compiling in debian (it says
	makeinfo is missing even though it is installed and in the $PATH)
Message-ID: <c1730de53c2204b07df078adac69450c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1664 
====================================================================== 
Reported By:                micklweiss
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1664
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-08-2007 08:09 PST
Last Modified:              12-08-2007 08:09 PST
====================================================================== 
Summary:                    error compiling in debian (it says makeinfo is
missing even though it is installed and in the $PATH)
Description: 
I get this: http://bugs.uclibc.org/bug_view_advanced_page.php?bug_id=1238
-- there is no option like in bugzilla here where i can request to reopen
an issue -- so I'm re-creating it here.

it was closed but I doubt that the person who closed it was using Ubuntu.
I say this since I can reproduce this persons problem on Debian (yes I
have texinfo/makeinfo installed).

I'm using:

$ makeinfo --version
makeinfo (GNU texinfo) 4.11

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-08-07 08:09  micklweiss     New Issue                                    
12-08-07 08:09  micklweiss     Status                   new => assigned     
12-08-07 08:09  micklweiss     Assigned To               => buildroot       
======================================================================
